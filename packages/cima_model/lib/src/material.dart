import 'package:cima_model/src/documento_material.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'material.g.dart';

@JsonSerializable()
class Material extends Equatable {
  Material({
    this.titulo,
    this.listaDocsPaciente,
    this.listaDocsProfesional,
    this.texto,
  });

  factory Material.fromJson(Map<String, dynamic> json) =>
      _$MaterialFromJson(json);

  final String? titulo;
  final List<DocumentoMaterial>? listaDocsPaciente;
  final List<DocumentoMaterial>? listaDocsProfesional;
  final String? texto;

  Map<String, dynamic> toJson() => _$MaterialToJson(this);

  @override
  List<Object?> get props => [
        titulo,
        listaDocsPaciente,
        listaDocsProfesional,
        texto,
      ];
}
