import 'dart:convert';
import 'dart:io';

import 'package:cima_model/cima_model.dart';
import 'package:test/test.dart';

void main() {
  group('Item', () {
    late Map<String, dynamic> json;
    late Item obj;

    setUp(() async {
      json = jsonDecode(
        await File('test/resources/item.json').readAsString(),
      );

      obj = Item(
        id: json['id'] as int,
        codigo: json['codigo'] as String,
        nombre: json['nombre'] as String,
      );
    });

    test('can be instantiated', () {
      expect(obj, isNotNull);
    });

    test('supports value comparisons', () {
      expect(
          Item(
                id: 1,
                codigo: 'abc123',
                nombre: '1',
              ) ==
              Item(
                id: 1,
                codigo: 'abc123',
                nombre: '1',
              ),
          isTrue);
    });

    test('json serialization fromJson', () {
      expect(Item.fromJson(json), obj);
    });

    test('json serialization toJson', () {
      expect(obj.toJson(), json);
    });
  });
}
