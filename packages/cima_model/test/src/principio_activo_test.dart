import 'dart:convert';
import 'dart:io';

import 'package:cima_model/cima_model.dart';
import 'package:test/test.dart';

void main() {
  group('Principio Activo', () {
    late Map<String, dynamic> json;
    late PrincipioActivo obj;

    setUp(() async {
      json = jsonDecode(
        await File('test/resources/principio_activo.json').readAsString(),
      );

      obj = PrincipioActivo(
        id: json['id'] as int,
        nombre: json['nombre'] as String,
        codigo: json['codigo'] as String,
        cantidad: json['cantidad'] as String,
        orden: json['orden'] as int,
        unidad: json['unidad'] as String,
      );
    });

    test('can be instantiated', () {
      expect(obj, isNotNull);
    });

    test('supports value comparisons', () {
      expect(
          PrincipioActivo(
                id: json['id'] as int,
                nombre: json['nombre'] as String,
                codigo: json['codigo'] as String,
                cantidad: json['cantidad'] as String,
                orden: json['orden'] as int,
                unidad: json['unidad'] as String,
              ) ==
              PrincipioActivo(
                id: json['id'] as int,
                nombre: json['nombre'] as String,
                codigo: json['codigo'] as String,
                cantidad: json['cantidad'] as String,
                orden: json['orden'] as int,
                unidad: json['unidad'] as String,
              ),
          isTrue);
    });

    test('json serialization fromJson', () {
      expect(PrincipioActivo.fromJson(json), obj);
    });

    test('json serialization toJson', () {
      expect(obj.toJson(), json);
    });
  });
}
