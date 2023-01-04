// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'changes_registry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangesRegistry _$ChangesRegistryFromJson(Map<String, dynamic> json) =>
    ChangesRegistry(
      registerNumber: json['nregistro'] as int,
      date: DateTime.parse(json['fecha'] as String),
      type: $enumDecode(_$ChangeTypeEnumMap, json['tipoCambio']),
      changes:
          (json['cambios'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ChangesRegistryToJson(ChangesRegistry instance) =>
    <String, dynamic>{
      'nregistro': instance.registerNumber,
      'fecha': instance.date.toIso8601String(),
      'tipoCambio': _$ChangeTypeEnumMap[instance.type]!,
      'cambios': instance.changes,
    };

const _$ChangeTypeEnumMap = {
  ChangeType.created: '1',
  ChangeType.deleted: '2',
  ChangeType.updated: '3',
};
