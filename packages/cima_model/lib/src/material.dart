import 'package:cima_model/src/material_document.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'material.g.dart';

@JsonSerializable(explicitToJson: true)
class Material extends Equatable {
  Material({
    this.title,
    this.activeIngredients,
    this.patientDocuments,
    this.practitionerDocuments,
  });

  factory Material.fromJson(Map<String, dynamic> json) =>
      _$MaterialFromJson(json);

  @JsonKey(name: 'medicamento')
  final String? title;

  @JsonKey(name: 'principiosActivos')
  final String? activeIngredients;

  @JsonKey(name: 'listaDocsPaciente')
  final List<MaterialDocument>? patientDocuments;

  @JsonKey(name: 'listaDocsProfesional')
  final List<MaterialDocument>? practitionerDocuments;

  Map<String, dynamic> toJson() => _$MaterialToJson(this);

  @override
  List<Object?> get props => [
        title,
        activeIngredients,
        patientDocuments,
        practitionerDocuments,
      ];
}
