/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:simply_queue_client/src/protocol/queue.dart' as _i3;
import 'package:simply_queue_client/src/protocol/store.dart' as _i4;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i5;
import 'protocol.dart' as _i6;

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointQueue extends _i1.EndpointRef {
  EndpointQueue(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'queue';

  _i2.Future<_i3.Queue> createQueue(int storeId) =>
      caller.callServerEndpoint<_i3.Queue>(
        'queue',
        'createQueue',
        {'storeId': storeId},
      );

  _i2.Stream<dynamic> streamQueue(int userId) =>
      caller.callStreamingServerEndpoint<_i2.Stream<dynamic>, dynamic>(
        'queue',
        'streamQueue',
        {'userId': userId},
        {},
      );

  _i2.Future<_i4.Store> resetQueue(int storeId) =>
      caller.callServerEndpoint<_i4.Store>(
        'queue',
        'resetQueue',
        {'storeId': storeId},
      );
}

/// {@category Endpoint}
class EndpointStore extends _i1.EndpointRef {
  EndpointStore(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'store';

  _i2.Future<List<_i4.Store>> getStores() =>
      caller.callServerEndpoint<List<_i4.Store>>(
        'store',
        'getStores',
        {},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i5.Caller(client);
  }

  late final _i5.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i6.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    example = EndpointExample(this);
    queue = EndpointQueue(this);
    store = EndpointStore(this);
    modules = _Modules(this);
  }

  late final EndpointExample example;

  late final EndpointQueue queue;

  late final EndpointStore store;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'example': example,
        'queue': queue,
        'store': store,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
