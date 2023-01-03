// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Document _$DocumentFromJson(Map<String, dynamic> json) => Document(
      type: $enumDecode(_$DocumentTypeEnumMap, json['tipo']),
      url: json['url'] as String?,
      htmlAvailable: json['secc'] as bool? ?? false,
      urlHtml: json['urlHtml'] as String?,
      lastModified: DateTime.parse(json['fecha'] as String),
    );

Map<String, dynamic> _$DocumentToJson(Document instance) {
  final val = <String, dynamic>{
    'tipo': _$DocumentTypeEnumMap[instance.type]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  val['secc'] = instance.htmlAvailable;
  writeNotNull('urlHtml', instance.urlHtml);
  val['fecha'] = instance.lastModified.toIso8601String();
  return val;
}

const _$DocumentTypeEnumMap = {
  DocumentType.fichaTecnica: 1,
  DocumentType.prospecto: 2,
  DocumentType.informePublicoEvaluacion: 3,
  DocumentType.planGestionRiesgos: 4,
};
