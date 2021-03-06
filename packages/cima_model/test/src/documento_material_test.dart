import 'dart:convert';
import 'dart:io';

import 'package:cima_model/cima_model.dart';
import 'package:test/test.dart';

void main() {
  group('DocumentoMaterial', () {
    late Map<String, dynamic> json;
    late DocumentoMaterial obj;

    setUp(() async {
      json = jsonDecode(
        await File('test/resources/documento_material.json').readAsString(),
      );

      obj = DocumentoMaterial(
        nombre: json['nombre'] as String,
        url: json['url'] as String,
        fecha: json['fecha'] as int,
      );
    });

    test('can be instantiated', () {
      expect(obj, isNotNull);
    });

    test('supports value comparisons', () {
      expect(
          DocumentoMaterial(
                nombre: 'nombre',
                url: 'url',
                fecha: 1,
              ) ==
              DocumentoMaterial(
                nombre: 'nombre',
                url: 'url',
                fecha: 1,
              ),
          isTrue);
    });

    test('json serialization fromJson', () {
      expect(DocumentoMaterial.fromJson(json), obj);
    });

    test('json serialization toJson', () {
      expect(obj.toJson(), json);
    });
  });
}
