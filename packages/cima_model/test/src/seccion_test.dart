import 'dart:convert';
import 'dart:io';

import 'package:cima_model/cima_model.dart';
import 'package:test/test.dart';

void main() {
  group('Seccion', () {
    late Map<String, dynamic> json;
    late Seccion obj;

    setUp(() async {
      json = jsonDecode(
        await File('test/resources/seccion.json').readAsString(),
      );

      obj = Seccion.fromJson(json);

      // obj = Seccion(
      //   seccion: json['seccion'] as String,
      //   titulo: json['titulo'] as String,
      //   orden: json['orden'] as int,
      //   contenido:
      //       json.containsKey('contenido') ? json['contenido'] as String : null,
      // );
    });

    test('can be instantiated', () {
      expect(obj, isNotNull);
    });

    test('supports value comparisons', () {
      expect(
          Seccion(
                seccion: 'seccion',
                titulo: 'titulo',
                orden: 1,
                contenido: 'contenido',
              ) ==
              Seccion(
                seccion: 'seccion',
                titulo: 'titulo',
                orden: 1,
                contenido: 'contenido',
              ),
          isTrue);
    });

    test('json serialization fromJson', () {
      expect(Seccion.fromJson(json), obj);
    });

    test('json serialization toJson', () {
      expect(obj.toJson(), json);
    });
  });
}
