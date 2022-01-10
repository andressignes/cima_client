// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Foto _$FotoFromJson(Map<String, dynamic> json) => Foto(
      tipo: json['tipo'] as String?,
      url: json['url'] as String?,
      fecha: json['fecha'] as int?,
    );

Map<String, dynamic> _$FotoToJson(Foto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tipo', instance.tipo);
  writeNotNull('url', instance.url);
  writeNotNull('fecha', instance.fecha);
  return val;
}
