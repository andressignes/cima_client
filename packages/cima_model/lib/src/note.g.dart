// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Note _$NoteFromJson(Map<String, dynamic> json) => Note(
      type: $enumDecode(_$NoteTypeEnumMap, json['tipo']),
      number: json['num'] as String,
      reference: json['ref'] as String?,
      issue: json['asunto'] as String?,
      publicationDate: json['fecha'] == null
          ? null
          : DateTime.parse(json['fecha'] as String),
      url: json['url'] == null ? null : Uri.parse(json['url'] as String),
    );

Map<String, dynamic> _$NoteToJson(Note instance) {
  final val = <String, dynamic>{
    'tipo': _$NoteTypeEnumMap[instance.type]!,
    'num': instance.number,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ref', instance.reference);
  writeNotNull('asunto', instance.issue);
  writeNotNull('fecha', instance.publicationDate?.toIso8601String());
  writeNotNull('url', instance.url?.toString());
  return val;
}

const _$NoteTypeEnumMap = {
  NoteType.securityNote: '1',
};
