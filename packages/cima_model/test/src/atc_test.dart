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
        name: atcJson['nombre'] as String,
        code: atcJson['codigo'] as String,
        level: atcJson['nivel'] as int,
      );
    });

    test('can be instantiated', () {
      expect(atcObj, isNotNull);
    });

    test('supports value comparisons', () {
      final code = 'fakeCode';
      final name = 'fakeName';
      final level = 1;
      expect(
          Atc(code: code, level: level, name: name) ==
              Atc(code: code, level: level, name: name),
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
