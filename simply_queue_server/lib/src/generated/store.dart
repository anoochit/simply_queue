/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: invalid_use_of_visible_for_testing_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i2;
import 'protocol.dart' as _i3;

abstract class Store implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = StoreTable();

  static const db = StoreRepository._();

  @override
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

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      'image': image,
      'currentQueue': currentQueue,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJsonForProtocol(),
      if (queues != null)
        'queues': queues?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static StoreInclude include({
    _i2.UserInfoInclude? userInfo,
    _i3.QueueIncludeList? queues,
  }) {
    return StoreInclude._(
      userInfo: userInfo,
      queues: queues,
    );
  }

  static StoreIncludeList includeList({
    _i1.WhereExpressionBuilder<StoreTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StoreTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StoreTable>? orderByList,
    StoreInclude? include,
  }) {
    return StoreIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Store.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Store.t),
      include: include,
    );
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

class StoreTable extends _i1.Table {
  StoreTable({super.tableRelation}) : super(tableName: 'store') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    image = _i1.ColumnString(
      'image',
      this,
    );
    currentQueue = _i1.ColumnInt(
      'currentQueue',
      this,
      hasDefault: true,
    );
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  late final _i1.ColumnString image;

  late final _i1.ColumnInt currentQueue;

  late final _i1.ColumnInt userInfoId;

  _i2.UserInfoTable? _userInfo;

  _i3.QueueTable? ___queues;

  _i1.ManyRelation<_i3.QueueTable>? _queues;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.UserInfoTable get userInfo {
    if (_userInfo != null) return _userInfo!;
    _userInfo = _i1.createRelationTable(
      relationFieldName: 'userInfo',
      field: Store.t.userInfoId,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _userInfo!;
  }

  _i3.QueueTable get __queues {
    if (___queues != null) return ___queues!;
    ___queues = _i1.createRelationTable(
      relationFieldName: '__queues',
      field: Store.t.id,
      foreignField: _i3.Queue.t.storeId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.QueueTable(tableRelation: foreignTableRelation),
    );
    return ___queues!;
  }

  _i1.ManyRelation<_i3.QueueTable> get queues {
    if (_queues != null) return _queues!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'queues',
      field: Store.t.id,
      foreignField: _i3.Queue.t.storeId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.QueueTable(tableRelation: foreignTableRelation),
    );
    _queues = _i1.ManyRelation<_i3.QueueTable>(
      tableWithRelations: relationTable,
      table: _i3.QueueTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _queues!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        description,
        image,
        currentQueue,
        userInfoId,
        createdAt,
        updatedAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'userInfo') {
      return userInfo;
    }
    if (relationField == 'queues') {
      return __queues;
    }
    return null;
  }
}

class StoreInclude extends _i1.IncludeObject {
  StoreInclude._({
    _i2.UserInfoInclude? userInfo,
    _i3.QueueIncludeList? queues,
  }) {
    _userInfo = userInfo;
    _queues = queues;
  }

  _i2.UserInfoInclude? _userInfo;

  _i3.QueueIncludeList? _queues;

  @override
  Map<String, _i1.Include?> get includes => {
        'userInfo': _userInfo,
        'queues': _queues,
      };

  @override
  _i1.Table get table => Store.t;
}

class StoreIncludeList extends _i1.IncludeList {
  StoreIncludeList._({
    _i1.WhereExpressionBuilder<StoreTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Store.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Store.t;
}

class StoreRepository {
  const StoreRepository._();

  final attach = const StoreAttachRepository._();

  final attachRow = const StoreAttachRowRepository._();

  Future<List<Store>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StoreTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StoreTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StoreTable>? orderByList,
    _i1.Transaction? transaction,
    StoreInclude? include,
  }) async {
    return session.db.find<Store>(
      where: where?.call(Store.t),
      orderBy: orderBy?.call(Store.t),
      orderByList: orderByList?.call(Store.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<Store?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StoreTable>? where,
    int? offset,
    _i1.OrderByBuilder<StoreTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StoreTable>? orderByList,
    _i1.Transaction? transaction,
    StoreInclude? include,
  }) async {
    return session.db.findFirstRow<Store>(
      where: where?.call(Store.t),
      orderBy: orderBy?.call(Store.t),
      orderByList: orderByList?.call(Store.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<Store?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    StoreInclude? include,
  }) async {
    return session.db.findById<Store>(
      id,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<List<Store>> insert(
    _i1.Session session,
    List<Store> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Store>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Store> insertRow(
    _i1.Session session,
    Store row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Store>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Store>> update(
    _i1.Session session,
    List<Store> rows, {
    _i1.ColumnSelections<StoreTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Store>(
      rows,
      columns: columns?.call(Store.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Store> updateRow(
    _i1.Session session,
    Store row, {
    _i1.ColumnSelections<StoreTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Store>(
      row,
      columns: columns?.call(Store.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Store>> delete(
    _i1.Session session,
    List<Store> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Store>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Store> deleteRow(
    _i1.Session session,
    Store row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Store>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Store>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<StoreTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Store>(
      where: where(Store.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StoreTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Store>(
      where: where?.call(Store.t),
      limit: limit,
      transaction: transaction ?? session.transaction,
    );
  }
}

class StoreAttachRepository {
  const StoreAttachRepository._();

  Future<void> queues(
    _i1.Session session,
    Store store,
    List<_i3.Queue> queue, {
    _i1.Transaction? transaction,
  }) async {
    if (queue.any((e) => e.id == null)) {
      throw ArgumentError.notNull('queue.id');
    }
    if (store.id == null) {
      throw ArgumentError.notNull('store.id');
    }

    var $queue = queue.map((e) => e.copyWith(storeId: store.id)).toList();
    await session.db.update<_i3.Queue>(
      $queue,
      columns: [_i3.Queue.t.storeId],
      transaction: transaction ?? session.transaction,
    );
  }
}

class StoreAttachRowRepository {
  const StoreAttachRowRepository._();

  Future<void> userInfo(
    _i1.Session session,
    Store store,
    _i2.UserInfo userInfo, {
    _i1.Transaction? transaction,
  }) async {
    if (store.id == null) {
      throw ArgumentError.notNull('store.id');
    }
    if (userInfo.id == null) {
      throw ArgumentError.notNull('userInfo.id');
    }

    var $store = store.copyWith(userInfoId: userInfo.id);
    await session.db.updateRow<Store>(
      $store,
      columns: [Store.t.userInfoId],
      transaction: transaction ?? session.transaction,
    );
  }

  Future<void> queues(
    _i1.Session session,
    Store store,
    _i3.Queue queue, {
    _i1.Transaction? transaction,
  }) async {
    if (queue.id == null) {
      throw ArgumentError.notNull('queue.id');
    }
    if (store.id == null) {
      throw ArgumentError.notNull('store.id');
    }

    var $queue = queue.copyWith(storeId: store.id);
    await session.db.updateRow<_i3.Queue>(
      $queue,
      columns: [_i3.Queue.t.storeId],
      transaction: transaction ?? session.transaction,
    );
  }
}
