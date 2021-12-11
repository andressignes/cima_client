// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seccion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Seccion _$SeccionFromJson(Map<String, dynamic> json) => Seccion(
      seccion: json['seccion'] as String?,
      titulo: json['titulo'] as String?,
      orden: json['orden'] as int?,
      contenido: json['contenido'] as String?,
    );

Map<String, dynamic> _$SeccionToJson(Seccion instance) => <String, dynamic>{
      'seccion': instance.seccion,
      'titulo': instance.titulo,
      'orden': instance.orden,
      'contenido': instance.contenido,
    };
