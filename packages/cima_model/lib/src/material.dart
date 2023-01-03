import 'package:cima_model/src/material_document.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'material.g.dart';

@JsonSerializable()
class Material extends Equatable {
  Material({
    required this.title,
    this.patientDocuments,
    this.practitionerDocuments,
    this.videoUrl,
  });

  factory Material.fromJson(Map<String, dynamic> json) =>
      _$MaterialFromJson(json);

  @JsonKey(name: 'titulo')
  final String title;
  @JsonKey(name: 'listaDocsPaciente')
  final List<MaterialDocument>? patientDocuments;
  @JsonKey(name: 'listaDocsProfesional')
  final List<MaterialDocument>? practitionerDocuments;
  @JsonKey(name: 'video')
  final String? videoUrl;

  Map<String, dynamic> toJson() => _$MaterialToJson(this);

  @override
  List<Object?> get props => [
        title,
        patientDocuments,
        practitionerDocuments,
        videoUrl,
      ];
}
