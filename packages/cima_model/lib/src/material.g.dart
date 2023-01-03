// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Material _$MaterialFromJson(Map<String, dynamic> json) => Material(
      title: json['titulo'] as String,
      patientDocuments: (json['listaDocsPaciente'] as List<dynamic>?)
          ?.map((e) => MaterialDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
      practitionerDocuments: (json['listaDocsProfesional'] as List<dynamic>?)
          ?.map((e) => MaterialDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
      videoUrl: json['video'] as String?,
    );

Map<String, dynamic> _$MaterialToJson(Material instance) {
  final val = <String, dynamic>{
    'titulo': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('listaDocsPaciente', instance.patientDocuments);
  writeNotNull('listaDocsProfesional', instance.practitionerDocuments);
  writeNotNull('video', instance.videoUrl);
  return val;
}
