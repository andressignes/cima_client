import 'package:equatable/equatable.dart';

abstract class Seccion extends Equatable {
  Seccion({this.seccion, this.titulo, this.orden, this.contenido});

  final String? seccion;
  final String? titulo;
  final int? orden;
  final String? contenido;
}
