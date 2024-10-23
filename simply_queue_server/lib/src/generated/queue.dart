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
import 'protocol.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;

abstract class Queue implements _i1.TableRow, _i1.ProtocolSerialization {
  Queue._({
    this.id,
    required this.number,
    required this.userInfoId,
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
    required int userInfoId,
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
      userInfoId: jsonSerialization['userInfoId'] as int,
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

  static final t = QueueTable();

  static const db = QueueRepository._();

  @override
  int? id;

  int number;

  int userInfoId;

  _i3.UserInfo? userInfo;

  int storeId;

  _i2.Store? store;

  _i2.Status status;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table get table => t;

  Queue copyWith({
    int? id,
    int? number,
    int? userInfoId,
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
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
      'storeId': storeId,
      if (store != null) 'store': store?.toJson(),
      'status': status.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'number': number,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJsonForProtocol(),
      'storeId': storeId,
      if (store != null) 'store': store?.toJsonForProtocol(),
      'status': status.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static QueueInclude include({
    _i3.UserInfoInclude? userInfo,
    _i2.StoreInclude? store,
  }) {
    return QueueInclude._(
      userInfo: userInfo,
      store: store,
    );
  }

  static QueueIncludeList includeList({
    _i1.WhereExpressionBuilder<QueueTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QueueTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QueueTable>? orderByList,
    QueueInclude? include,
  }) {
    return QueueIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Queue.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Queue.t),
      include: include,
    );
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
    required int userInfoId,
    _i3.UserInfo? userInfo,
    required int storeId,
    _i2.Store? store,
    _i2.Status? status,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          number: number,
          userInfoId: userInfoId,
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
    int? userInfoId,
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
      userInfoId: userInfoId ?? this.userInfoId,
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

class QueueTable extends _i1.Table {
  QueueTable({super.tableRelation}) : super(tableName: 'queue') {
    number = _i1.ColumnInt(
      'number',
      this,
    );
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
    storeId = _i1.ColumnInt(
      'storeId',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
      hasDefault: true,
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

  late final _i1.ColumnInt number;

  late final _i1.ColumnInt userInfoId;

  _i3.UserInfoTable? _userInfo;

  late final _i1.ColumnInt storeId;

  _i2.StoreTable? _store;

  late final _i1.ColumnEnum<_i2.Status> status;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i3.UserInfoTable get userInfo {
    if (_userInfo != null) return _userInfo!;
    _userInfo = _i1.createRelationTable(
      relationFieldName: 'userInfo',
      field: Queue.t.userInfoId,
      foreignField: _i3.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _userInfo!;
  }

  _i2.StoreTable get store {
    if (_store != null) return _store!;
    _store = _i1.createRelationTable(
      relationFieldName: 'store',
      field: Queue.t.storeId,
      foreignField: _i2.Store.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.StoreTable(tableRelation: foreignTableRelation),
    );
    return _store!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        number,
        userInfoId,
        storeId,
        status,
        createdAt,
        updatedAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'userInfo') {
      return userInfo;
    }
    if (relationField == 'store') {
      return store;
    }
    return null;
  }
}

class QueueInclude extends _i1.IncludeObject {
  QueueInclude._({
    _i3.UserInfoInclude? userInfo,
    _i2.StoreInclude? store,
  }) {
    _userInfo = userInfo;
    _store = store;
  }

  _i3.UserInfoInclude? _userInfo;

  _i2.StoreInclude? _store;

  @override
  Map<String, _i1.Include?> get includes => {
        'userInfo': _userInfo,
        'store': _store,
      };

  @override
  _i1.Table get table => Queue.t;
}

class QueueIncludeList extends _i1.IncludeList {
  QueueIncludeList._({
    _i1.WhereExpressionBuilder<QueueTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Queue.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Queue.t;
}

class QueueRepository {
  const QueueRepository._();

  final attachRow = const QueueAttachRowRepository._();

  Future<List<Queue>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QueueTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QueueTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QueueTable>? orderByList,
    _i1.Transaction? transaction,
    QueueInclude? include,
  }) async {
    return session.db.find<Queue>(
      where: where?.call(Queue.t),
      orderBy: orderBy?.call(Queue.t),
      orderByList: orderByList?.call(Queue.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<Queue?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QueueTable>? where,
    int? offset,
    _i1.OrderByBuilder<QueueTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QueueTable>? orderByList,
    _i1.Transaction? transaction,
    QueueInclude? include,
  }) async {
    return session.db.findFirstRow<Queue>(
      where: where?.call(Queue.t),
      orderBy: orderBy?.call(Queue.t),
      orderByList: orderByList?.call(Queue.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<Queue?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    QueueInclude? include,
  }) async {
    return session.db.findById<Queue>(
      id,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<List<Queue>> insert(
    _i1.Session session,
    List<Queue> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Queue>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Queue> insertRow(
    _i1.Session session,
    Queue row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Queue>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Queue>> update(
    _i1.Session session,
    List<Queue> rows, {
    _i1.ColumnSelections<QueueTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Queue>(
      rows,
      columns: columns?.call(Queue.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Queue> updateRow(
    _i1.Session session,
    Queue row, {
    _i1.ColumnSelections<QueueTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Queue>(
      row,
      columns: columns?.call(Queue.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Queue>> delete(
    _i1.Session session,
    List<Queue> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Queue>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Queue> deleteRow(
    _i1.Session session,
    Queue row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Queue>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Queue>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<QueueTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Queue>(
      where: where(Queue.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QueueTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Queue>(
      where: where?.call(Queue.t),
      limit: limit,
      transaction: transaction ?? session.transaction,
    );
  }
}

class QueueAttachRowRepository {
  const QueueAttachRowRepository._();

  Future<void> userInfo(
    _i1.Session session,
    Queue queue,
    _i3.UserInfo userInfo, {
    _i1.Transaction? transaction,
  }) async {
    if (queue.id == null) {
      throw ArgumentError.notNull('queue.id');
    }
    if (userInfo.id == null) {
      throw ArgumentError.notNull('userInfo.id');
    }

    var $queue = queue.copyWith(userInfoId: userInfo.id);
    await session.db.updateRow<Queue>(
      $queue,
      columns: [Queue.t.userInfoId],
      transaction: transaction ?? session.transaction,
    );
  }

  Future<void> store(
    _i1.Session session,
    Queue queue,
    _i2.Store store, {
    _i1.Transaction? transaction,
  }) async {
    if (queue.id == null) {
      throw ArgumentError.notNull('queue.id');
    }
    if (store.id == null) {
      throw ArgumentError.notNull('store.id');
    }

    var $queue = queue.copyWith(storeId: store.id);
    await session.db.updateRow<Queue>(
      $queue,
      columns: [Queue.t.storeId],
      transaction: transaction ?? session.transaction,
    );
  }
}
