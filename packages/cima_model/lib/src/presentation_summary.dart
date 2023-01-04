import 'package:cima_model/src/medication_status.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'presentation_summary.g.dart';

@JsonSerializable()
class PresentationSummary extends Equatable {
  PresentationSummary({
    required this.registrationNumber,
    required this.nationalCode,
    required this.name,
    required this.status,
    required this.haveSupplyProblems,
    required this.isCommercialized,
    required this.activeIngredient,
    required this.laboratory,
    required this.conditionPrescriptions,
    required this.affectsDriving,
    required this.hasTriangle,
    required this.isOrphan,
    required this.isRegisteredByEMA,
    required this.documents,
    required this.haveNotes,
  });

  factory PresentationSummary.fromJson(Map<String, dynamic> json) =>
      _$PresentationSummaryFromJson(json);

  /// Numero de registro del medicamento
  @JsonKey(name: 'nregistro')
  final String registrationNumber;

  /// Codigo nacional del medicamento
  @JsonKey(name: 'cn')
  final String nationalCode;

  /// Nombre de la presentacion
  @JsonKey(name: 'nombre')
  final String name;

  @JsonKey(name: 'pactivo')
  final String activeIngredient;

  @JsonKey(name: 'labtitular')
  final String laboratory;

  @JsonKey(name: 'estado')
  final MedicationStatus status;

  @JsonKey(name: 'cpresc')
  final String conditionPrescriptions;

  @JsonKey(name: 'comerc')
  final bool isCommercialized;

  @JsonKey(name: 'conduc')
  final bool affectsDriving;

  @JsonKey(name: 'triangulo')
  final bool hasTriangle;

  @JsonKey(name: 'huerfano')
  final bool isOrphan;

  @JsonKey(name: 'ema')
  final bool isRegisteredByEMA;

  @JsonKey(name: 'psum')
  final bool haveSupplyProblems;

  @JsonKey(name: 'docs')
  final String documents;

  @JsonKey(name: 'notas')
  final bool haveNotes;

  Map<String, dynamic> toJson() => _$PresentationSummaryToJson(this);

  @override
  List<Object?> get props => [
        registrationNumber,
        nationalCode,
        name,
        activeIngredient,
        laboratory,
        status,
        conditionPrescriptions,
        isCommercialized,
        affectsDriving,
        hasTriangle,
        isOrphan,
        isRegisteredByEMA,
        haveSupplyProblems,
        documents,
        haveNotes,
      ];
}
