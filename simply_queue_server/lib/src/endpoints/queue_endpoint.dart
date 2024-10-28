import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

// This is an example endpoint of your server. It's best practice to use the
// `Endpoint` ending of the class name, but it will be removed when accessing
// the endpoint from the client. I.e., this endpoint can be accessed through
// `client.example` on the client side.

// After adding or modifying an endpoint, you will need to run
// `serverpod generate` to update the server and client code.
class QueueEndpoint extends Endpoint {
  // You create methods in your endpoint which are accessible from the client by
  // creating a public method with `Session` as its first parameter.
  // `bool`, `int`, `double`, `String`, `UuidValue`, `Duration`, `DateTime`, `ByteData`,
  // and other serializable classes, exceptions and enums from your from your `protocol` directory.
  // The methods should return a typed future; the same types as for the parameters are
  // supported. The `session` object provides access to the database, logging,
  // passwords, and information about the request being made to the server.

  @override
  bool get requireLogin => true;

  // create customer queue
  Future<Queue?> createQueue(Session session, int storeId) async {
    final auth = await session.authenticated;
    final userId = auth!.userId;

    // check current queue and get latest queue
    final store = await Store.db.findById(
      session,
      storeId,
      include: Store.include(
        queues: Queue.includeList(
          orderBy: (p) => p.number,
          orderDescending: true,
          limit: 1,
        ),
      ),
    );

    // store exist, add new queue
    if (store != null) {
      final queues = store.queues;
      if (queues!.isNotEmpty) {
        // add queue
        final lastQueue = queues.first;
        final lastQueueNumber = lastQueue.number;

        final row = Queue(
          number: (lastQueueNumber + 1),
          userInfoId: userId,
          storeId: storeId,
          createdAt: DateTime.now(),
        );

        final result = await Queue.db.insertRow(session, row);

        // post message to central message stream
        session.messages.postMessage('store_$storeId', result);

        // post message to central customer message stream
        session.messages.postMessage('customer_$userId', result);

        return result;
      } else {
        // add first queue
        final row = Queue(
          number: 1,
          userInfoId: userId,
          storeId: storeId,
          createdAt: DateTime.now(),
        );

        final result = await Queue.db.insertRow(session, row);

        // post message to central store message stream
        session.messages.postMessage('store_$storeId', result);
        // post message to central customer message stream
        session.messages.postMessage('customer_$userId', result);

        return result;
      }
    }

    return null;
  }

  // store stream queue
  Stream streamQueue(Session session, int userId) async* {
    // get store
    final stores = await Store.db.find(
      session,
      where: (p) => p.userInfoId.equals(userId),
    );

    if (stores.isNotEmpty) {
      final store = stores.first;
      final storeId = store.id;
      session.log('Queues for store = $storeId');
      final queues = await Queue.db.find(
        session,
        where: (p) =>
            p.status.inSet({Status.current, Status.wait}) &
            p.storeId.equals(storeId),
        orderBy: (p) => p.number,
        orderDescending: false,
      );

      session.log('Queues for store = ${store.id}, lenght = ${queues.length}');
      // send queue snapshot
      yield QueueSnapshot(queues: queues);

      // get queue stream message
      var messageStream =
          session.messages.createStream<Queue>('store_$storeId');
      // send queue stream message
      await for (var message in messageStream) {
        yield message;
      }
    } else {
      session.log('Not found store for user = $userId ');
    }

    yield null;
  }

  // next first queue
  Future<Queue> nextFirstQueue(Session session, Queue queue) async {
    final row = queue;
    final storeId = queue.storeId;
    row.status = Status.current;
    final result = await Queue.db.updateRow(session, row);

    // post message to central store message stream
    session.messages.postMessage('store_$storeId', result);
    // post message to central customer message stream
    session.messages.postMessage('customer_${result.userInfoId}', result);

    return result;
  }

  // next second is queue
  Future<Queue> nextWaitQueue(
      Session session, Queue currentQueue, Queue nextQueue) async {
    final currentQueueRow = currentQueue;
    final nextQueueRow = nextQueue;
    final storeId = currentQueue.storeId;

    currentQueueRow.status = Status.done;
    nextQueueRow.status = Status.current;

    // update current queue status
    final currentQueueRowResult =
        await Queue.db.updateRow(session, currentQueueRow);

    // post message to central store message stream
    session.messages.postMessage('store_$storeId', currentQueueRowResult);
    // post message to central customer message stream
    // session.messages.postMessage(
    //     'customer_${currentQueueRowResult.userInfoId}', currentQueueRowResult);

    // update next queue status
    final nextQueueResult = await Queue.db.updateRow(session, nextQueueRow);

    // post message to central store message stream
    session.messages.postMessage('store_$storeId', nextQueueResult);
    // post message to central customer message stream
    session.messages
        .postMessage('customer_${nextQueueResult.userInfoId}', nextQueueResult);

    return nextQueueResult;
  }

  // get store queue snapshot
  Future<List<Queue>?> queueSnapshot(Session session, int userId) async {
    // get store
    final stores = await Store.db.find(
      session,
      where: (p) => p.userInfoId.equals(userId),
    );

    if (stores.isNotEmpty) {
      final store = stores.first;
      final storeId = store.id;
      session.log('Queues for store = $storeId');
      final queues = await Queue.db.find(
        session,
        where: (p) =>
            p.status.inSet({Status.current, Status.wait}) &
            p.storeId.equals(storeId),
        orderBy: (p) => p.number,
        orderDescending: false,
        limit: 10,
      );

      return queues;
    } else {
      return null;
    }
  }

  // customer queue subscription
  Stream customerStreamQueue(Session session, int userId) async* {
    // find customer queue
    final queues = await Queue.db.find(
      session,
      include: Queue.include(store: Store.include()),
      where: (p) => p.status.inSet({Status.current, Status.wait}),
      orderBy: (p) => p.number,
      orderDescending: false,
    );

    // send snapshot stream
    final snapshotStreamQueue = QueueSnapshot(queues: queues);
    yield snapshotStreamQueue;

    // get queue stream message
    var messageStream =
        session.messages.createStream<Queue>('customer_$userId');
    // send queue stream message
    await for (var message in messageStream) {
      yield message;
    }
  }

  // get customer queue snapshot
  Future<List<Queue>> customerQueueSnapshot(Session session, int userId) async {
    final queues = await Queue.db.find(
      session,
      include: Queue.include(store: Store.include()),
      where: (p) =>
          p.status.inSet({Status.current, Status.wait}) &
          p.userInfoId.equals(userId),
      orderBy: (p) => p.number,
      orderDescending: false,
      limit: 10,
    );

    return queues;
  }
}
