import 'package:equatable/equatable.dart';

abstract class Atc extends Equatable {
  Atc({this.codigo, this.nombre, this.nivel});

  final String? codigo;
  final String? nombre;
  final int? nivel;
}
