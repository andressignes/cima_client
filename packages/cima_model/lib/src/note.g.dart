// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Note _$NoteFromJson(Map<String, dynamic> json) => Note(
      type: $enumDecode(_$NoteTypeEnumMap, json['tipo']),
      number: json['num'] as String,
      reference: json['referencia'] as String?,
      issue: json['asunto'] as String?,
      publicationDate: Note._fromJson(json['fecha'] as int?),
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

  writeNotNull('referencia', instance.reference);
  writeNotNull('asunto', instance.issue);
  writeNotNull('fecha', Note._toJson(instance.publicationDate));
  writeNotNull('url', instance.url?.toString());
  return val;
}

const _$NoteTypeEnumMap = {
  NoteType.securityNote: 1,
};
