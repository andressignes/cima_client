import 'package:equatable/equatable.dart';

import 'atc.dart';
import 'documento.dart';
import 'estado.dart';
import 'foto.dart';
import 'item.dart';
import 'presentacion.dart';
import 'principio_activo.dart';

abstract class Medicamento extends Equatable {
  final String? nregistro;
  final String? nombre;
  final String? pactivos;
  final String? labtitular;
  final Estado? estado;
  final String? cpresc;
  final bool? comerc;
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
  final List<Item>? viasAdministracion;
  final Item? nosustituible;
  final List<Presentacion>? presentaciones;
  final Item? formaFarmaceutica;
  final Item? formaFarmaceuticaSimplificada;
  final String? dosis;

  Medicamento(
      {this.nregistro,
      this.nombre,
      this.pactivos,
      this.labtitular,
      this.estado,
      this.cpresc,
      this.comerc,
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
      this.viasAdministracion,
      this.nosustituible,
      this.presentaciones,
      this.formaFarmaceutica,
      this.formaFarmaceuticaSimplificada,
      this.dosis});
}
