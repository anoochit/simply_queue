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
import 'protocol.dart' as _i2;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i3;

abstract class Queue implements _i1.SerializableModel {
  Queue._({
    this.id,
    required this.number,
    this.userInfo,
    required this.storeId,
    this.store,
    _i2.Status? status,
    required this.createdAt,
    DateTime? updatedAt,
  })  : status = status ?? _i2.Status.wait,
        updatedAt = updatedAt ?? DateTime.now();

  factory Queue({
    int? id,
    required int number,
    _i3.UserInfo? userInfo,
    required int storeId,
    _i2.Store? store,
    _i2.Status? status,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _QueueImpl;

  factory Queue.fromJson(Map<String, dynamic> jsonSerialization) {
    return Queue(
      id: jsonSerialization['id'] as int?,
      number: jsonSerialization['number'] as int,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i3.UserInfo.fromJson(
              (jsonSerialization['userInfo'] as Map<String, dynamic>)),
      storeId: jsonSerialization['storeId'] as int,
      store: jsonSerialization['store'] == null
          ? null
          : _i2.Store.fromJson(
              (jsonSerialization['store'] as Map<String, dynamic>)),
      status: _i2.Status.fromJson((jsonSerialization['status'] as String)),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int number;

  _i3.UserInfo? userInfo;

  int storeId;

  _i2.Store? store;

  _i2.Status status;

  DateTime createdAt;

  DateTime updatedAt;

  Queue copyWith({
    int? id,
    int? number,
    _i3.UserInfo? userInfo,
    int? storeId,
    _i2.Store? store,
    _i2.Status? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'number': number,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
      'storeId': storeId,
      if (store != null) 'store': store?.toJson(),
      'status': status.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _QueueImpl extends Queue {
  _QueueImpl({
    int? id,
    required int number,
    _i3.UserInfo? userInfo,
    required int storeId,
    _i2.Store? store,
    _i2.Status? status,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          number: number,
          userInfo: userInfo,
          storeId: storeId,
          store: store,
          status: status,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  @override
  Queue copyWith({
    Object? id = _Undefined,
    int? number,
    Object? userInfo = _Undefined,
    int? storeId,
    Object? store = _Undefined,
    _i2.Status? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Queue(
      id: id is int? ? id : this.id,
      number: number ?? this.number,
      userInfo:
          userInfo is _i3.UserInfo? ? userInfo : this.userInfo?.copyWith(),
      storeId: storeId ?? this.storeId,
      store: store is _i2.Store? ? store : this.store?.copyWith(),
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
