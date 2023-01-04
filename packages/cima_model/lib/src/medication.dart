import 'package:cima_model/src/models.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'medication.g.dart';

/// {@template medication}
/// A model containing data about a Medication
/// {@endtemplate}
@JsonSerializable()
class Medication extends Equatable {
  /// {@macro medication}
  Medication({
    required this.registerNumber,
    required this.name,
    this.activeIngredient,
    this.laboratory,
    this.status,
    this.conditionPrescriptions,
    this.havePresentations,
    this.needPrescription,
    this.isGeneric,
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
    this.atc,
    this.activeIngredients,
    this.excipients,
    this.routesAdministration,
    this.typeDrugNotSubstitutable,
    this.presentations,
    this.pharmaceuticalForm,
    this.pharmaceuticalFormSimplified,
    this.vtm,
    this.dosage,
  });

  factory Medication.fromJson(Map<String, dynamic> json) =>
      _$MedicationFromJson(json);

  /// Numero de registro del medicamento
  @JsonKey(name: 'nregistro')
  final String registerNumber;

  /// Nombre del medicamento
  @JsonKey(name: 'nombre')
  final String name;

  /// Lista de principios activos separada por comas. Solo aparece el nombre
  @JsonKey(name: 'pactivos')
  final String? activeIngredient;

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

  @JsonKey(name: 'generico')
  final bool? isGeneric;

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

  /// Indica si el medicamento se ha registrado por procedimiento centralizado (EMA) o no
  @JsonKey(name: 'ema')
  final bool? isRegisteredByEMA;

  /// Indica si el medicamento tienen problemas de suministro abiertos
  @JsonKey(name: 'psum')
  final bool? haveSupplyProblems;

  /// Lista de documentos asociados al medicamento
  @JsonKey(name: 'docs')
  final List<Document>? documents;

  /// Lista de imágenes asociadas al medicamento
  @JsonKey(name: 'fotos')
  final List<Photo>? photos;

  /// Indica si existen notas asociadas al medicamento
  @JsonKey(name: 'notas')
  final bool? notes;

  /// Indica si existen materiales informativos asociados al medicamento
  @JsonKey(name: 'materialesInf')
  final bool? availableInformativeMaterials;

  /// Lista de códigos ATC asociados al medicamento
  @JsonKey(name: 'atcs')
  final List<Atc>? atc;

  /// Lista de los principios activos del medicamento
  @JsonKey(name: 'principiosActivos')
  final List<PrincipioActivo>? activeIngredients;

  /// Lista de excipientes del medicamento
  @JsonKey(name: 'excipientes')
  final List<Excipient>? excipients;

  /// Lista de las vías de administración para las que está autorizado el medicamento
  @JsonKey(name: 'viasAdministracion')
  final List<Item>? routesAdministration;

  //// Indica el tipo de medicamento sustituible que es
  @JsonKey(name: 'nosustituible')
  final Item? typeDrugNotSubstitutable;

  @JsonKey(name: 'presentaciones')
  final List<Presentation>? presentations;

  @JsonKey(name: 'formaFarmaceutica')
  final Item? pharmaceuticalForm;

  @JsonKey(name: 'formaFarmaceuticaSimplificada')
  final Item? pharmaceuticalFormSimplified;

  @JsonKey(name: 'vtm')
  final Item? vtm;

  @JsonKey(name: 'dosis')
  final String? dosage;

  Map<String, dynamic> toJson() => _$MedicationToJson(this);

  Document? getDocument(DocumentType type) {
    if (documents == null) return null;
    if (documents!.indexWhere((element) => element.type == type) == -1) {
      return null;
    }
    return documents!.firstWhere((d) => d.type == type);
  }

  Uri? get photoMaterial {
    if (photos == null ||
        photos!.isEmpty ||
        photos!.indexWhere((photo) => photo.type == PhotoType.material) == -1) {
      return null;
    }
    return photos!.firstWhere((photo) => photo.type == PhotoType.material).url;
  }

  Uri? get photoPharmaceuticalProduct {
    if (photos == null ||
        photos!.isEmpty ||
        photos!.indexWhere(
                (photo) => photo.type == PhotoType.pharmaceuticalProduct) ==
            -1) {
      return null;
    }
    return photos!
        .firstWhere((photo) => photo.type == PhotoType.pharmaceuticalProduct)
        .url;
  }

  @override
  List<Object?> get props => [
        registerNumber,
        name,
        activeIngredient,
        laboratory,
        status,
        conditionPrescriptions,
        havePresentations,
        needPrescription,
        isGeneric,
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
        atc,
        activeIngredients,
        excipients,
        routesAdministration,
        typeDrugNotSubstitutable,
        presentations,
        pharmaceuticalForm,
        pharmaceuticalFormSimplified,
        vtm,
        dosage,
      ];
}
