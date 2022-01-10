import 'dart:convert';
import 'dart:io';

import 'package:cima_model/cima_model.dart';
import 'package:test/test.dart';

void main() {
  group('Atc', () {
    late Map<String, dynamic> atcJson;
    late Atc atcObj;

    setUp(() async {
      atcJson = jsonDecode(
        await File('test/resources/atc.json').readAsString(),
      );

      atcObj = Atc(
        nombre: atcJson['nombre'] as String,
        codigo: atcJson['codigo'] as String,
        nivel: atcJson['nivel'] as int,
      );
    });

    test('can be instantiated', () {
      expect(atcObj, isNotNull);
    });

    test('supports value comparisons', () {
      expect(
          Atc(codigo: '', nivel: 0, nombre: '') ==
              Atc(codigo: '', nivel: 0, nombre: ''),
          isTrue);
    });

    test('json serialization fromJson', () {
      expect(Atc.fromJson(atcJson), atcObj);
    });

    test('json serialization toJson', () {
      expect(atcObj.toJson(), atcJson);
    });
  });
}
