import 'package:cima_model/src/models.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'medicamento.g.dart';

@JsonSerializable()
class Medicamento extends Equatable {
  Medicamento({
    required this.nregistro,
    required this.nombre,
    this.pactivos,
    this.labtitular,
    this.estado,
    this.cpresc,
    this.comerc,
    this.receta,
    this.generico,
    this.conduc,
    this.triangulo,
    this.huerfano,
    this.biosimilar,
    this.ema,
    this.psum,
    this.docs,
    this.fotos,
    this.notas,
    this.materialesInf,
    this.atcs,
    this.principiosActivos,
    this.excipientes,
    this.viasAdministracion,
    this.nosustituible,
    this.presentaciones,
    this.formaFarmaceutica,
    this.formaFarmaceuticaSimplificada,
    this.dosis,
  });

  factory Medicamento.fromJson(Map<String, dynamic> json) =>
      _$MedicamentoFromJson(json);

  @JsonKey(name: 'nregistro')
  final String nregistro;
  @JsonKey(name: 'nombre')
  final String nombre;
  @JsonKey(name: 'pactivos')
  final String? pactivos;
  @JsonKey(name: 'labtitular')
  final String? labtitular;
  @JsonKey(name: 'estado')
  final MedicationStatus? estado;
  @JsonKey(name: 'cpresc')
  final String? cpresc;
  @JsonKey(name: 'comerc')
  final bool? comerc;
  @JsonKey(name: 'receta')
  final bool? receta;
  @JsonKey(name: 'generico')
  final bool? generico;
  @JsonKey(name: 'conduc')
  final bool? conduc;
  @JsonKey(name: 'triangulo')
  final bool? triangulo;
  @JsonKey(name: 'huerfano')
  final bool? huerfano;
  @JsonKey(name: 'biosimilar')
  final bool? biosimilar;
  @JsonKey(name: 'ema')
  final bool? ema;
  @JsonKey(name: 'psum')
  final bool? psum;
  @JsonKey(name: 'docs')
  final List<Document>? docs;
  @JsonKey(name: 'fotos')
  final List<Photo>? fotos;
  @JsonKey(name: 'notas')
  final bool? notas;
  @JsonKey(name: 'materialesInf')
  final bool? materialesInf;
  @JsonKey(name: 'atcs')
  final List<Atc>? atcs;
  @JsonKey(name: 'principiosActivos')
  final List<PrincipioActivo>? principiosActivos;
  @JsonKey(name: 'excipientes')
  final List<Excipient>? excipientes;
  @JsonKey(name: 'viasAdministracion')
  final List<Item>? viasAdministracion;
  @JsonKey(name: 'nosustituible')
  final Item? nosustituible;
  @JsonKey(name: 'presentaciones')
  final List<Presentation>? presentaciones;
  @JsonKey(name: 'formaFarmaceutica')
  final Item? formaFarmaceutica;
  @JsonKey(name: 'formaFarmaceuticaSimplificada')
  final Item? formaFarmaceuticaSimplificada;
  @JsonKey(name: 'dosis')
  final String? dosis;

  Map<String, dynamic> toJson() => _$MedicamentoToJson(this);

  Document? getDocumento(DocumentType type) {
    if (docs == null) return null;
    if (docs!.indexWhere((element) => element.type == type) == -1) return null;
    return docs!.firstWhere((d) => d.type == type);
  }

  Uri? get photoMaterialAs {
    if (fotos == null ||
        fotos!.isEmpty ||
        fotos!.indexWhere((photo) => photo.type == PhotoType.material) == -1) {
      return null;
    }
    return fotos!.firstWhere((photo) => photo.type == PhotoType.material).url;
  }

  Uri? get photoFormaFarmaceutica {
    if (fotos == null ||
        fotos!.isEmpty ||
        fotos!.indexWhere(
                (photo) => photo.type == PhotoType.pharmaceuticalProduct) ==
            -1) {
      return null;
    }
    return fotos!
        .firstWhere((photo) => photo.type == PhotoType.pharmaceuticalProduct)
        .url;
  }

  @override
  List<Object?> get props => [
        nregistro,
        nombre,
        pactivos,
        labtitular,
        estado,
        cpresc,
        comerc,
        receta,
        generico,
        conduc,
        triangulo,
        huerfano,
        biosimilar,
        ema,
        psum,
        docs,
        fotos,
        notas,
        materialesInf,
        atcs,
        principiosActivos,
        excipientes,
        viasAdministracion,
        nosustituible,
        presentaciones,
        formaFarmaceutica,
        formaFarmaceuticaSimplificada,
        dosis
      ];
}
