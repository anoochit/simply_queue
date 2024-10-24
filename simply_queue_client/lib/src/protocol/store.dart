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
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i2;
import 'protocol.dart' as _i3;

abstract class Store implements _i1.SerializableModel {
  Store._({
    this.id,
    required this.name,
    required this.description,
    required this.image,
    int? currentQueue,
    required this.userInfoId,
    this.userInfo,
    this.queues,
    required this.createdAt,
    DateTime? updatedAt,
  })  : currentQueue = currentQueue ?? 0,
        updatedAt = updatedAt ?? DateTime.now();

  factory Store({
    int? id,
    required String name,
    required String description,
    required String image,
    int? currentQueue,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    List<_i3.Queue>? queues,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _StoreImpl;

  factory Store.fromJson(Map<String, dynamic> jsonSerialization) {
    return Store(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      image: jsonSerialization['image'] as String,
      currentQueue: jsonSerialization['currentQueue'] as int,
      userInfoId: jsonSerialization['userInfoId'] as int,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['userInfo'] as Map<String, dynamic>)),
      queues: (jsonSerialization['queues'] as List?)
          ?.map((e) => _i3.Queue.fromJson((e as Map<String, dynamic>)))
          .toList(),
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

  String name;

  String description;

  String image;

  int currentQueue;

  int userInfoId;

  _i2.UserInfo? userInfo;

  List<_i3.Queue>? queues;

  DateTime createdAt;

  DateTime updatedAt;

  Store copyWith({
    int? id,
    String? name,
    String? description,
    String? image,
    int? currentQueue,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    List<_i3.Queue>? queues,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      'image': image,
      'currentQueue': currentQueue,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
      if (queues != null)
        'queues': queues?.toJson(valueToJson: (v) => v.toJson()),
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

class _StoreImpl extends Store {
  _StoreImpl({
    int? id,
    required String name,
    required String description,
    required String image,
    int? currentQueue,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    List<_i3.Queue>? queues,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          name: name,
          description: description,
          image: image,
          currentQueue: currentQueue,
          userInfoId: userInfoId,
          userInfo: userInfo,
          queues: queues,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  @override
  Store copyWith({
    Object? id = _Undefined,
    String? name,
    String? description,
    String? image,
    int? currentQueue,
    int? userInfoId,
    Object? userInfo = _Undefined,
    Object? queues = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Store(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      currentQueue: currentQueue ?? this.currentQueue,
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
      queues: queues is List<_i3.Queue>?
          ? queues
          : this.queues?.map((e0) => e0.copyWith()).toList(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
