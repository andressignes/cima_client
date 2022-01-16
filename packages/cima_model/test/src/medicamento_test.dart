import 'dart:convert';
import 'dart:io';

import 'package:cima_model/cima_model.dart';
import 'package:test/test.dart';

void main() {
  group('Medicamento', () {
    late Map<String, dynamic> json;
    late Medicamento obj;

    setUp(() async {
      json = jsonDecode(
        await File('test/resources/medicamento.json').readAsString(),
      );

      obj = Medicamento(
        nregistro: json['nregistro'] as String,
        nombre: json['nombre'] as String,
        pactivos: json['pactivos'] as String,
        labtitular: json['labtitular'] as String,
        estado: Estado.fromJson(json['estado']),
        cpresc: json['cpresc'] as String,
        comerc: json['comerc'] as bool,
        receta: json['receta'] as bool,
        generico: json['generico'] as bool,
        conduc: json['conduc'] as bool,
        triangulo: json['triangulo'] as bool,
        huerfano: json['huerfano'] as bool,
        biosimilar: json['biosimilar'] as bool,
        ema: json['ema'] as bool,
        psum: json['psum'] as bool,
        docs: (json['docs'] as List).map((e) => Documento.fromJson(e)).toList(),
        fotos: (json['fotos'] as List).map((e) => Foto.fromJson(e)).toList(),
        notas: json['notas'] as bool,
        materialesInf: json['materialesInf'] as bool,
        atcs: (json['atcs'] as List).map((e) => Atc.fromJson(e)).toList(),
        principiosActivos: (json['principiosActivos'] as List)
            .map((e) => PrincipioActivo.fromJson(e))
            .toList(),
        excipientes: (json['excipientes'] as List)
            .map((e) => PrincipioActivo.fromJson(e))
            .toList(),
        viasAdministracion: (json['viasAdministracion'] as List)
            .map((e) => Item.fromJson(e))
            .toList(),
        nosustituible: Item.fromJson(json['nosustituible']),
        presentaciones: (json['presentaciones'] as List)
            .map((e) => Presentacion.fromJson(e))
            .toList(),
        formaFarmaceutica: Item.fromJson(json['formaFarmaceutica']),
        formaFarmaceuticaSimplificada:
            Item.fromJson(json['formaFarmaceuticaSimplificada']),
        vtm: Item.fromJson(json['vtm']),
        dosis: json['dosis'] as String,
      );
    });

    test('can be instantiated', () {
      expect(obj, isNotNull);
    });

    test('supports value comparisons', () {
      expect(
          Medicamento(
                nregistro: '1',
                nombre: 'nombre',
                pactivos: 'pactivos',
                labtitular: 'labtitular',
                estado: Estado(susp: 1, rev: 1, aut: 1),
                cpresc: 'cpresc',
                comerc: true,
                receta: true,
                conduc: true,
                triangulo: true,
                huerfano: true,
                biosimilar: true,
                ema: true,
                psum: true,
                docs: [
                  Documento(
                      tipo: TipoDocumento.fichaTecnica, secc: true, url: 'url')
                ],
                fotos: [Foto(tipo: '', url: 'url', fecha: 1)],
                notas: true,
                materialesInf: true,
                atcs: [Atc(nombre: 'nombre', codigo: 'codigo')],
                principiosActivos: [
                  PrincipioActivo(nombre: 'nombre', codigo: 'codigo')
                ],
                viasAdministracion: [Item(nombre: 'nombre', codigo: 'codigo')],
                nosustituible: Item(nombre: 'nombre', codigo: 'codigo'),
                presentaciones: [Presentacion(cn: '', nombre: 'nombre')],
                formaFarmaceutica: Item(nombre: 'nombre', codigo: 'codigo'),
                formaFarmaceuticaSimplificada: Item(
                  nombre: 'nombre',
                  codigo: 'codigo',
                ),
                dosis: 'dosis',
              ) ==
              Medicamento(
                nregistro: '1',
                nombre: 'nombre',
                pactivos: 'pactivos',
                labtitular: 'labtitular',
                estado: Estado(susp: 1, rev: 1, aut: 1),
                cpresc: 'cpresc',
                comerc: true,
                receta: true,
                conduc: true,
                triangulo: true,
                huerfano: true,
                biosimilar: true,
                ema: true,
                psum: true,
                docs: [
                  Documento(
                      tipo: TipoDocumento.fichaTecnica, secc: true, url: 'url')
                ],
                fotos: [Foto(tipo: '', url: 'url', fecha: 1)],
                notas: true,
                materialesInf: true,
                atcs: [Atc(nombre: 'nombre', codigo: 'codigo')],
                principiosActivos: [
                  PrincipioActivo(nombre: 'nombre', codigo: 'codigo')
                ],
                viasAdministracion: [Item(nombre: 'nombre', codigo: 'codigo')],
                nosustituible: Item(nombre: 'nombre', codigo: 'codigo'),
                presentaciones: [Presentacion(cn: '', nombre: 'nombre')],
                formaFarmaceutica: Item(nombre: 'nombre', codigo: 'codigo'),
                formaFarmaceuticaSimplificada: Item(
                  nombre: 'nombre',
                  codigo: 'codigo',
                ),
                dosis: 'dosis',
              ),
          isTrue);
    });

    test('json serialization fromJson', () {
      expect(Medicamento.fromJson(json), obj);
    });

    test('json serialization toJson', () {
      expect(obj.toJson(), json);
    });
  });
}
