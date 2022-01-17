import 'dart:convert';
import 'dart:io';

import 'package:cima_model/cima_model.dart';
import 'package:test/test.dart';

void main() {
  group('Material', () {
    late Map<String, dynamic> json;
    late Material obj;

    setUp(() async {
      json = jsonDecode(
        await File('test/resources/material.json').readAsString(),
      );

      obj = Material.fromJson(json);
    });

    test('can be instantiated', () {
      expect(Material(), isNotNull);
    });

    test('supports value comparisons', () {
      expect(
          Material(
                medicamento: 'Título',
                listaDocsPaciente: List.empty(),
                listaDocsProfesional: List.empty(),
                principiosActivos: 'Texto',
              ) ==
              Material(
                medicamento: 'Título',
                listaDocsPaciente: List.empty(),
                listaDocsProfesional: List.empty(),
                principiosActivos: 'Texto',
              ),
          isTrue);

      expect(
          Material(
                medicamento: 'Título',
                listaDocsPaciente: List.empty(),
                listaDocsProfesional: List.empty(),
                principiosActivos: 'Texto',
              ) ==
              Material(
                medicamento: 'Título',
                // listaDocsPaciente: List.empty(),
                listaDocsProfesional: List.empty(),
                principiosActivos: 'Texto',
              ),
          isFalse);
    });

    test('json serialization fromJson', () {
      expect(Material.fromJson(json), obj);
    });

    test('json serialization toJson', () {
      expect(obj.medicamento, json['medicamento']);
    });
  });
}
