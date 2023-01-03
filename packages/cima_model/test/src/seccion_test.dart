import 'dart:convert';
import 'dart:io';

import 'package:cima_model/cima_model.dart';
import 'package:test/test.dart';

void main() {
  group('Seccion', () {
    late Map<String, dynamic> json;
    late DocumentSection obj;

    setUp(() async {
      json = jsonDecode(
        await File('test/resources/seccion.json').readAsString(),
      );

      obj = DocumentSection.fromJson(json);

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
          DocumentSection(
                section: 'seccion',
                title: 'titulo',
                order: 1,
                body: 'contenido',
              ) ==
              DocumentSection(
                section: 'seccion',
                title: 'titulo',
                order: 1,
                body: 'contenido',
              ),
          isTrue);
    });

    test('json serialization fromJson', () {
      expect(DocumentSection.fromJson(json), obj);
    });

    test('json serialization toJson', () {
      expect(obj.toJson(), json);
    });
  });
}
