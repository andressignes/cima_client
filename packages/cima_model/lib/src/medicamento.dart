import 'package:cima_model/src/models.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'medicamento.g.dart';

@JsonSerializable()
class Medicamento extends Equatable {
  Medicamento({
    this.nregistro,
    this.nombre,
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
    this.vtm,
    this.dosis,
  });

  factory Medicamento.fromJson(Map<String, dynamic> json) =>
      _$MedicamentoFromJson(json);

  final String? nregistro;
  final String? nombre;
  final String? pactivos;
  final String? labtitular;
  final Estado? estado;
  final String? cpresc;
  final bool? comerc;
  final bool? receta;
  final bool? generico;
  final bool? conduc;
  final bool? triangulo;
  final bool? huerfano;
  final bool? biosimilar;
  final bool? ema;
  final bool? psum;
  final List<Documento>? docs;
  final List<Foto>? fotos;
  final bool? notas;
  final bool? materialesInf;
  final List<Atc>? atcs;
  final List<PrincipioActivo>? principiosActivos;
  final List<PrincipioActivo>? excipientes;
  final List<Item>? viasAdministracion;
  final Item? nosustituible;
  final List<Presentacion>? presentaciones;
  final Item? formaFarmaceutica;
  final Item? formaFarmaceuticaSimplificada;
  final Item? vtm;
  final String? dosis;

  Map<String, dynamic> toJson() => _$MedicamentoToJson(this);

  Documento? getDocumento(TipoDocumento type) {
    if (docs == null) return null;
    if (docs!.indexWhere((element) => element.tipo == type) == -1) return null;
    return docs!.firstWhere((d) => d.tipo == type);
  }

  Uri? get photoMaterialAs {
    if (fotos == null ||
        fotos!.isEmpty ||
        fotos!.indexWhere((photo) => photo.tipo == 'materialas') == -1) {
      return null;
    }
    return Uri.parse(
        fotos!.firstWhere((photo) => photo.tipo == 'materialas').url!);
  }

  Uri? get photoFormaFarmaceutica {
    if (fotos == null ||
        fotos!.isEmpty ||
        fotos!.indexWhere((photo) => photo.tipo == 'formafarmac') == -1) {
      return null;
    }
    return Uri.parse(
        fotos!.firstWhere((photo) => photo.tipo == 'formafarmac').url!);
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
        vtm,
        dosis
      ];
}
