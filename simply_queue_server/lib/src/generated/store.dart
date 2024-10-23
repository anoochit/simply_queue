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

abstract class Store implements _i1.TableRow, _i1.ProtocolSerialization {
  Store._({
    this.id,
    required this.name,
    required this.description,
    required this.image,
    int? currentQueue,
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
    List<_i2.Queue>? queues,
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
      queues: (jsonSerialization['queues'] as List?)
          ?.map((e) => _i2.Queue.fromJson((e as Map<String, dynamic>)))
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

  List<_i2.Queue>? queues;

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
    List<_i2.Queue>? queues,
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
      if (queues != null)
        'queues': queues?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static StoreInclude include({_i2.QueueIncludeList? queues}) {
    return StoreInclude._(queues: queues);
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
    List<_i2.Queue>? queues,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          name: name,
          description: description,
          image: image,
          currentQueue: currentQueue,
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
      queues: queues is List<_i2.Queue>?
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

  _i2.QueueTable? ___queues;

  _i1.ManyRelation<_i2.QueueTable>? _queues;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.QueueTable get __queues {
    if (___queues != null) return ___queues!;
    ___queues = _i1.createRelationTable(
      relationFieldName: '__queues',
      field: Store.t.id,
      foreignField: _i2.Queue.t.storeId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.QueueTable(tableRelation: foreignTableRelation),
    );
    return ___queues!;
  }

  _i1.ManyRelation<_i2.QueueTable> get queues {
    if (_queues != null) return _queues!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'queues',
      field: Store.t.id,
      foreignField: _i2.Queue.t.storeId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.QueueTable(tableRelation: foreignTableRelation),
    );
    _queues = _i1.ManyRelation<_i2.QueueTable>(
      tableWithRelations: relationTable,
      table: _i2.QueueTable(
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
        createdAt,
        updatedAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'queues') {
      return __queues;
    }
    return null;
  }
}

class StoreInclude extends _i1.IncludeObject {
  StoreInclude._({_i2.QueueIncludeList? queues}) {
    _queues = queues;
  }

  _i2.QueueIncludeList? _queues;

  @override
  Map<String, _i1.Include?> get includes => {'queues': _queues};

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
    List<_i2.Queue> queue, {
    _i1.Transaction? transaction,
  }) async {
    if (queue.any((e) => e.id == null)) {
      throw ArgumentError.notNull('queue.id');
    }
    if (store.id == null) {
      throw ArgumentError.notNull('store.id');
    }

    var $queue = queue.map((e) => e.copyWith(storeId: store.id)).toList();
    await session.db.update<_i2.Queue>(
      $queue,
      columns: [_i2.Queue.t.storeId],
      transaction: transaction ?? session.transaction,
    );
  }
}

class StoreAttachRowRepository {
  const StoreAttachRowRepository._();

  Future<void> queues(
    _i1.Session session,
    Store store,
    _i2.Queue queue, {
    _i1.Transaction? transaction,
  }) async {
    if (queue.id == null) {
      throw ArgumentError.notNull('queue.id');
    }
    if (store.id == null) {
      throw ArgumentError.notNull('store.id');
    }

    var $queue = queue.copyWith(storeId: store.id);
    await session.db.updateRow<_i2.Queue>(
      $queue,
      columns: [_i2.Queue.t.storeId],
      transaction: transaction ?? session.transaction,
    );
  }
}
