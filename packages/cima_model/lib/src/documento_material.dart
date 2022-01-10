import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'documento_material.g.dart';

/// Contiene la información relativa a los documentos asociados a un medicamento
@JsonSerializable()
class DocumentoMaterial extends Equatable {
  DocumentoMaterial({this.nombre, this.url, this.fecha});

  factory DocumentoMaterial.fromJson(Map<String, dynamic> json) =>
      _$DocumentoMaterialFromJson(json);

  final String? nombre;
  final String? url;
  final int? fecha;

  Map<String, dynamic> toJson() => _$DocumentoMaterialToJson(this);

  @override
  List<Object?> get props => [nombre, url, fecha];
}
