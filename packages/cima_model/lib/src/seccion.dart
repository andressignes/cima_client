import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'seccion.g.dart';

@JsonSerializable()
class Seccion extends Equatable {
  Seccion({this.seccion, this.titulo, this.orden, this.contenido});

  factory Seccion.fromJson(Map<String, dynamic> json) =>
      _$SeccionFromJson(json);

  final String? seccion;
  final String? titulo;
  final int? orden;
  final String? contenido;

  Map<String, dynamic> toJson() => _$SeccionToJson(this);

  @override
  List<Object?> get props => [seccion, titulo, orden, contenido];
}
