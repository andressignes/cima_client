import 'dart:convert';
import 'dart:io';

import 'package:cima_model/cima_model.dart';
import 'package:test/test.dart';

void main() {
  group('Problema Suministro', () {
    late Map<String, dynamic> json;
    late SupplyProblems obj;

    setUpAll(() async {
      json = jsonDecode(
        await File('test/resources/problema_suministro.json').readAsString(),
      );

      obj = SupplyProblems.fromJson(json);

      // obj = ProblemaSuministro(
      //   cn: json['cn'] as String,
      //   nombre: json['nombre'] as String,
      //   activo: json['activo'] as bool,
      //   fini: json['fini'] as int,
      //   ffin: json['ffin'] as int,
      //   observ: json['observ'] as String,
      // );
    });

    test('can be instantiated', () {
      expect(obj, isNotNull);
    });

    test('supports value comparisons', () {
      expect(
          SupplyProblems(
                cn: '1',
                nombre: '1',
                activo: true,
                fini: 1,
                ffin: 1,
                observ: '1',
              ) ==
              SupplyProblems(
                cn: '1',
                nombre: '1',
                activo: true,
                fini: 1,
                ffin: 1,
                observ: '1',
              ),
          isTrue);
    });

    test('json serialization fromJson', () {
      expect(SupplyProblems.fromJson(json), obj);
    });

    test('json serialization toJson', () {
      expect(obj.toJson(), json);
    });
  });
}
