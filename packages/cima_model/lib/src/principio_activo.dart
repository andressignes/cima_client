import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'principio_activo.g.dart';

@JsonSerializable()
class PrincipioActivo extends Equatable {
  PrincipioActivo(
      {this.id,
      this.codigo,
      this.nombre,
      this.cantidad,
      this.unidad,
      this.orden});

  factory PrincipioActivo.fromJson(Map<String, dynamic> json) =>
      _$PrincipioActivoFromJson(json);

  final int? id;
  final String? codigo;
  final String? nombre;
  final String? cantidad;
  final String? unidad;
  final int? orden;

  Map<String, dynamic> toJson() => _$PrincipioActivoToJson(this);

  @override
  List<Object?> get props => [
        id,
        codigo,
        nombre,
        cantidad,
        unidad,
        orden,
      ];
}
