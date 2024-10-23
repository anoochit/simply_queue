/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'example.dart' as _i2;
import 'queue.dart' as _i3;
import 'status.dart' as _i4;
import 'store.dart' as _i5;
import 'protocol.dart' as _i6;
import 'package:simply_queue_client/src/protocol/store.dart' as _i7;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i8;
export 'example.dart';
export 'queue.dart';
export 'status.dart';
export 'store.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Example) {
      return _i2.Example.fromJson(data) as T;
    }
    if (t == _i3.Queue) {
      return _i3.Queue.fromJson(data) as T;
    }
    if (t == _i4.Status) {
      return _i4.Status.fromJson(data) as T;
    }
    if (t == _i5.Store) {
      return _i5.Store.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Example?>()) {
      return (data != null ? _i2.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Queue?>()) {
      return (data != null ? _i3.Queue.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Status?>()) {
      return (data != null ? _i4.Status.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Store?>()) {
      return (data != null ? _i5.Store.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i6.Queue>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i6.Queue>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i7.Store>) {
      return (data as List).map((e) => deserialize<_i7.Store>(e)).toList()
          as dynamic;
    }
    try {
      return _i8.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Example) {
      return 'Example';
    }
    if (data is _i3.Queue) {
      return 'Queue';
    }
    if (data is _i4.Status) {
      return 'Status';
    }
    if (data is _i5.Store) {
      return 'Store';
    }
    className = _i8.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Example') {
      return deserialize<_i2.Example>(data['data']);
    }
    if (data['className'] == 'Queue') {
      return deserialize<_i3.Queue>(data['data']);
    }
    if (data['className'] == 'Status') {
      return deserialize<_i4.Status>(data['data']);
    }
    if (data['className'] == 'Store') {
      return deserialize<_i5.Store>(data['data']);
    }
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i8.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
