import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

// This is an example endpoint of your server. It's best practice to use the
// `Endpoint` ending of the class name, but it will be removed when accessing
// the endpoint from the client. I.e., this endpoint can be accessed through
// `client.example` on the client side.

// After adding or modifying an endpoint, you will need to run
// `serverpod generate` to update the server and client code.
class StoreEndpoint extends Endpoint {
  // You create methods in your endpoint which are accessible from the client by
  // creating a public method with `Session` as its first parameter.
  // `bool`, `int`, `double`, `String`, `UuidValue`, `Duration`, `DateTime`, `ByteData`,
  // and other serializable classes, exceptions and enums from your from your `protocol` directory.
  // The methods should return a typed future; the same types as for the parameters are
  // supported. The `session` object provides access to the database, logging,
  // passwords, and information about the request being made to the server.

  // get stores
  Future<List<Store>> getStores(Session session) async {
    return await Store.db.find(
      session,
      orderBy: (p) => p.createdAt,
      orderDescending: true,
    );
  }

  // create store
  Future<Store> createStore(Session session, Store store) async {
    return await Store.db.insertRow(session, store);
  }

  // reset queue
  Future<Store> resetQueue(Session session, int id) async {
    // find store
    final store = await Store.db.findById(session, id);
    // reset queue
    store!.currentQueue = 0;
    // update store queue
    final result = await Store.db.updateRow(session, store);
    return result;
  }
}

class UserScope extends Scope {
  const UserScope(String super.name);

  static const admin = UserScope('admin');
  static const customer = UserScope('customer');
  static const store = UserScope('store');
}
