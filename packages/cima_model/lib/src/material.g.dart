// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Material _$MaterialFromJson(Map<String, dynamic> json) => Material(
      titulo: json['titulo'] as String?,
      listaDocsPaciente: (json['listaDocsPaciente'] as List<dynamic>?)
          ?.map((e) => DocumentoMaterial.fromJson(e as Map<String, dynamic>))
          .toList(),
      listaDocsProfesional: (json['listaDocsProfesional'] as List<dynamic>?)
          ?.map((e) => DocumentoMaterial.fromJson(e as Map<String, dynamic>))
          .toList(),
      texto: json['texto'] as String?,
    );

Map<String, dynamic> _$MaterialToJson(Material instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('titulo', instance.titulo);
  writeNotNull('listaDocsPaciente', instance.listaDocsPaciente);
  writeNotNull('listaDocsProfesional', instance.listaDocsProfesional);
  writeNotNull('texto', instance.texto);
  return val;
}
