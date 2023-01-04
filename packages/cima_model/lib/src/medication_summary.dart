import 'package:cima_model/src/models.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'medication_summary.g.dart';

/// {@template medication_summary}
/// A model containing data about a Medication summary
/// {@endtemplate}
@JsonSerializable()
class MedicationSummary extends Equatable {
  /// {@macro medication_summary}
  MedicationSummary({
    required this.registerNumber,
    required this.name,
    this.laboratory,
    this.status,
    this.conditionPrescriptions,
    this.havePresentations,
    this.needPrescription,
    this.affectsDriving,
    this.hasTriangle,
    this.isOrphan,
    this.biosimilar,
    this.isRegisteredByEMA,
    this.haveSupplyProblems,
    this.documents,
    this.photos,
    this.notes,
    this.availableInformativeMaterials,
    this.routesAdministration,
    this.typeDrugNotSubstitutable,
    this.pharmaceuticalForm,
    this.pharmaceuticalFormSimplified,
    this.dosage,
  });

  factory MedicationSummary.fromJson(Map<String, dynamic> json) =>
      _$MedicationSummaryFromJson(json);

  /// Numero de registro del medicamento
  @JsonKey(name: 'nregistro')
  final String registerNumber;

  /// Nombre del medicamento
  @JsonKey(name: 'nombre')
  final String name;

  /// Laboratorio titular del medicamento
  @JsonKey(name: 'labtitular')
  final String? laboratory;

  /// Estado de registro del medicamento
  @JsonKey(name: 'estado')
  final MedicationStatus? status;

  /// Condiciones de prescripción del medicamento
  @JsonKey(name: 'cpresc')
  final String? conditionPrescriptions;

  /// Indica si tiene alguna presentación comercializada
  @JsonKey(name: 'comerc')
  final bool? havePresentations;

  /// Indica si el medicamento necesita de receta médica para su dispensación
  @JsonKey(name: 'receta')
  final bool? needPrescription;

  /// Indica si el medicamento afecta o no a la conducción
  @JsonKey(name: 'conduc')
  final bool? affectsDriving;

  /// Indica si el medicamento tienen asociado el triangulo negro
  @JsonKey(name: 'triangulo')
  final bool? hasTriangle;

  /// Indica si el medicamento está considerado como medicamentos huérfano
  @JsonKey(name: 'huerfano')
  final bool? isOrphan;

  /// Indica si el medicamento está considerado como biosimilar
  @JsonKey(name: 'biosimilar')
  final bool? biosimilar;

  //// Indica el tipo de medicamento sustituible que es
  @JsonKey(name: 'nosustituible')
  final Item? typeDrugNotSubstitutable;

  /// Indica si el medicamento tienen problemas de suministro abiertos
  @JsonKey(name: 'psum')
  final bool? haveSupplyProblems;

  /// Indica si el medicamento se ha registrado por procedimiento centralizado (EMA) o no
  @JsonKey(name: 'ema')
  final bool? isRegisteredByEMA;

  /// Indica si existen notas asociadas al medicamento
  @JsonKey(name: 'notas')
  final bool? notes;

  /// Indica si existen materiales informativos asociados al medicamento
  @JsonKey(name: 'materialesInf')
  final bool? availableInformativeMaterials;

  /// Lista de documentos asociados al medicamento
  @JsonKey(name: 'docs')
  final List<Document>? documents;

  /// Lista de imágenes asociadas al medicamento
  @JsonKey(name: 'fotos')
  final List<Photo>? photos;

  /// Lista de las vías de administración para las que está autorizado el medicamento
  @JsonKey(name: 'viasAdministracion')
  final List<Item>? routesAdministration;

  @JsonKey(name: 'formaFarmaceutica')
  final Item? pharmaceuticalForm;

  @JsonKey(name: 'formaFarmaceuticaSimplificada')
  final Item? pharmaceuticalFormSimplified;

  @JsonKey(name: 'dosis')
  final String? dosage;

  Map<String, dynamic> toJson() => _$MedicationSummaryToJson(this);

  @override
  List<Object?> get props => [
        registerNumber,
        name,
        laboratory,
        status,
        conditionPrescriptions,
        havePresentations,
        needPrescription,
        affectsDriving,
        hasTriangle,
        isOrphan,
        biosimilar,
        isRegisteredByEMA,
        haveSupplyProblems,
        documents,
        photos,
        notes,
        availableInformativeMaterials,
        routesAdministration,
        typeDrugNotSubstitutable,
        pharmaceuticalForm,
        pharmaceuticalFormSimplified,
        dosage,
      ];
}
