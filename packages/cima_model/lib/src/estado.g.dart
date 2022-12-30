// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estado.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Estado _$EstadoFromJson(Map<String, dynamic> json) => Estado(
      aut: json['aut'] as int?,
      susp: json['susp'] as int?,
      rev: json['rev'] as int?,
    );

Map<String, dynamic> _$EstadoToJson(Estado instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('aut', instance.aut);
  writeNotNull('susp', instance.susp);
  writeNotNull('rev', instance.rev);
  return val;
}
