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
    final user = await session.authenticated;

    // calculate queue

    // create queue
    final row = Queue(
        number: 1,
        storeId: storeId,
        userInfoId: user!.userId,
        createdAt: DateTime.now());

    final queue = await Queue.db.insertRow(session, row);

    // post message to central message stream
    session.messages.postMessage('store_${storeId}', queue);

    return queue;
  }

  // stream queue
  Stream streamQueue(Session session, int storeId) async* {
    yield '';
  }
}
