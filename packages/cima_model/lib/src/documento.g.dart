// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documento.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Documento _$DocumentoFromJson(Map<String, dynamic> json) => Documento(
      tipo: $enumDecode(_$TipoDocumentoEnumMap, json['tipo']),
      url: json['url'] as String?,
      secc: json['secc'] as bool?,
    );

Map<String, dynamic> _$DocumentoToJson(Documento instance) {
  final val = <String, dynamic>{
    'tipo': _$TipoDocumentoEnumMap[instance.tipo],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  writeNotNull('secc', instance.secc);
  return val;
}

const _$TipoDocumentoEnumMap = {
  TipoDocumento.fichaTecnica: 1,
  TipoDocumento.prospecto: 2,
  TipoDocumento.informePublicoEvaluacion: 3,
  TipoDocumento.planGestionRiesgos: 4,
};
