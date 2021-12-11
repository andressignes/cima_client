import 'package:equatable/equatable.dart';

import 'documento_material.dart';

abstract class Material extends Equatable {
  final String? titulo;
  final List<DocumentoMaterial>? listaDocsPaciente;
  final List<DocumentoMaterial>? listaDocsProfesional;
  final String? texto;

  Material(
      {this.titulo,
      this.listaDocsPaciente,
      this.listaDocsProfesional,
      this.texto});
}
