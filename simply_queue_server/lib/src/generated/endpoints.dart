/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/example_endpoint.dart' as _i2;
import '../endpoints/queue_endpoint.dart' as _i3;
import '../endpoints/store_endpoint.dart' as _i4;
import 'package:simply_queue_server/src/generated/queue.dart' as _i5;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i6;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'example': _i2.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'queue': _i3.QueueEndpoint()
        ..initialize(
          server,
          'queue',
          null,
        ),
      'store': _i4.StoreEndpoint()
        ..initialize(
          server,
          'store',
          null,
        ),
    };
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i2.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['queue'] = _i1.EndpointConnector(
      name: 'queue',
      endpoint: endpoints['queue']!,
      methodConnectors: {
        'createQueue': _i1.MethodConnector(
          name: 'createQueue',
          params: {
            'storeId': _i1.ParameterDescription(
              name: 'storeId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['queue'] as _i3.QueueEndpoint).createQueue(
            session,
            params['storeId'],
          ),
        ),
        'nextFirstQueue': _i1.MethodConnector(
          name: 'nextFirstQueue',
          params: {
            'queue': _i1.ParameterDescription(
              name: 'queue',
              type: _i1.getType<_i5.Queue>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['queue'] as _i3.QueueEndpoint).nextFirstQueue(
            session,
            params['queue'],
          ),
        ),
        'nextWaitQueue': _i1.MethodConnector(
          name: 'nextWaitQueue',
          params: {
            'currentQueue': _i1.ParameterDescription(
              name: 'currentQueue',
              type: _i1.getType<_i5.Queue>(),
              nullable: false,
            ),
            'nextQueue': _i1.ParameterDescription(
              name: 'nextQueue',
              type: _i1.getType<_i5.Queue>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['queue'] as _i3.QueueEndpoint).nextWaitQueue(
            session,
            params['currentQueue'],
            params['nextQueue'],
          ),
        ),
        'queueSnapshot': _i1.MethodConnector(
          name: 'queueSnapshot',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['queue'] as _i3.QueueEndpoint).queueSnapshot(
            session,
            params['userId'],
          ),
        ),
        'customerQueueSnapshot': _i1.MethodConnector(
          name: 'customerQueueSnapshot',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['queue'] as _i3.QueueEndpoint).customerQueueSnapshot(
            session,
            params['userId'],
          ),
        ),
        'streamQueue': _i1.MethodStreamConnector(
          name: 'streamQueue',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['queue'] as _i3.QueueEndpoint).streamQueue(
            session,
            params['userId'],
          ),
        ),
        'customerStreamQueue': _i1.MethodStreamConnector(
          name: 'customerStreamQueue',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['queue'] as _i3.QueueEndpoint).customerStreamQueue(
            session,
            params['userId'],
          ),
        ),
      },
    );
    connectors['store'] = _i1.EndpointConnector(
      name: 'store',
      endpoint: endpoints['store']!,
      methodConnectors: {
        'getStores': _i1.MethodConnector(
          name: 'getStores',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['store'] as _i4.StoreEndpoint).getStores(session),
        )
      },
    );
    modules['serverpod_auth'] = _i6.Endpoints()..initializeEndpoints(server);
  }
}
