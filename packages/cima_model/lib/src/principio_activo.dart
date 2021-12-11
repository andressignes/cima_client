import 'package:equatable/equatable.dart';

abstract class PrincipioActivo extends Equatable {
  PrincipioActivo(
      {this.id,
      this.codigo,
      this.nombre,
      this.cantidad,
      this.unidad,
      this.orden});

  final int? id;
  final String? codigo;
  final String? nombre;
  final String? cantidad;
  final String? unidad;
  final int? orden;
}
