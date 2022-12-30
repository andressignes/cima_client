import 'dart:convert';
import 'dart:io';

import 'package:cima_model/cima_model.dart';
import 'package:test/test.dart';

void main() {
  group('Nota', () {
    late Map<String, dynamic> json;
    late Nota obj;

    setUp(() async {
      json = jsonDecode(
        await File('test/resources/nota.json').readAsString(),
      );

      obj = Nota(
        tipo: json['tipo'] as int,
        num: json['num'] as String,
        referencia: json['referencia'] as String,
        asunto: json['asunto'] as String,
        fecha: json['fecha'] as int,
        url: json['url'] as String,
      );
    });

    test('can be instantiated', () {
      expect(obj, isNotNull);
    });

    test('supports value comparisons', () {
      expect(
          Nota(
                tipo: 1,
                num: '1',
                referencia: '1',
                asunto: '1',
                fecha: 1,
                url: '1',
              ) ==
              Nota(
                tipo: 1,
                num: '1',
                referencia: '1',
                asunto: '1',
                fecha: 1,
                url: '1',
              ),
          isTrue);
    });

    test('json serialization fromJson', () {
      expect(Nota.fromJson(json), obj);
    });

    test('json serialization toJson', () {
      expect(obj.toJson(), json);
    });
  });
}
