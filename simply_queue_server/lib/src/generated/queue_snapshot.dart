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
import 'protocol.dart' as _i2;

abstract class QueueSnapshot
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  QueueSnapshot._({required this.queues});

  factory QueueSnapshot({required List<_i2.Queue> queues}) = _QueueSnapshotImpl;

  factory QueueSnapshot.fromJson(Map<String, dynamic> jsonSerialization) {
    return QueueSnapshot(
        queues: (jsonSerialization['queues'] as List)
            .map((e) => _i2.Queue.fromJson((e as Map<String, dynamic>)))
            .toList());
  }

  List<_i2.Queue> queues;

  QueueSnapshot copyWith({List<_i2.Queue>? queues});
  @override
  Map<String, dynamic> toJson() {
    return {'queues': queues.toJson(valueToJson: (v) => v.toJson())};
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {'queues': queues.toJson(valueToJson: (v) => v.toJsonForProtocol())};
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _QueueSnapshotImpl extends QueueSnapshot {
  _QueueSnapshotImpl({required List<_i2.Queue> queues})
      : super._(queues: queues);

  @override
  QueueSnapshot copyWith({List<_i2.Queue>? queues}) {
    return QueueSnapshot(
        queues: queues ?? this.queues.map((e0) => e0.copyWith()).toList());
  }
}
