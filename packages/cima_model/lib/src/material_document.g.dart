// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaterialDocument _$MaterialDocumentFromJson(Map<String, dynamic> json) =>
    MaterialDocument(
      name: json['nombre'] as String,
      url: Uri.parse(json['url'] as String),
      lastUpdate: MaterialDocument._dateTimeFromEpoch(json['fecha'] as int),
      isVideo: json['video'] as bool?,
    );

Map<String, dynamic> _$MaterialDocumentToJson(MaterialDocument instance) {
  final val = <String, dynamic>{
    'nombre': instance.name,
    'url': instance.url.toString(),
    'fecha': MaterialDocument._dateTimeToEpoch(instance.lastUpdate),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('video', instance.isVideo);
  return val;
}
