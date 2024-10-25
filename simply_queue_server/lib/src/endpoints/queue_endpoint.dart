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

  // TODO : create queue
  Future<Queue> createQueue(Session session, int storeId) async {
    late Queue row;
    late int queueNumber;
    final user = await session.authenticated;

    // check current queue and get latest queue
    final store = await Store.db.findById(
      session,
      storeId,
      include: Store.include(
        queues: Queue.includeList(
          orderBy: (p) => p.number,
          orderDescending: true,
        ),
      ),
    );

    final storeCurrentQueue = store!.currentQueue;

    // calculate queue
    // if store current queue = 0, create a first one
    if (storeCurrentQueue == 0) {
      session.log('No queue data, insert first queue');
      queueNumber = 1;
      // create queue
      row = Queue(
        number: 1,
        storeId: storeId,
        userInfoId: user!.userId,
        createdAt: DateTime.now(),
      );
    } else {
      session.log('Already has queue, insert a new once');
      // check a lastest queue number and plus 1
      final lastestQueue = store.queues;
      queueNumber = lastestQueue!.first.number + 1;
      row = Queue(
        number: queueNumber,
        storeId: storeId,
        userInfoId: user!.userId,
        createdAt: DateTime.now(),
      );
    }

    // insert queue
    session.log('Insert queue');
    final queue = await Queue.db.insertRow(session, row);

    // post message to central message stream
    session.messages.postMessage('store_$storeId', queue);

    return queue;
  }

  // stream queue
  Stream streamQueue(Session session, int storeId) async* {
    // get store queue

    // send list queue

    // send updated queue
    yield '';
  }

  // reset queue
  Future<Store> resetQueue(Session session, int storeId) async {
    // find store
    final store = await Store.db.findById(session, storeId);
    // reset queue
    store!.currentQueue = 0;
    // update store queue
    final result = await Store.db.updateRow(session, store);
    return result;
  }
}
