import 'dart:convert';
import 'dart:io';

import 'package:cima_model/cima_model.dart';
import 'package:test/test.dart';

void main() {
  group('Nota', () {
    late Map<String, dynamic> json;
    late Note obj;

    setUp(() async {
      json = jsonDecode(
        await File('test/resources/nota.json').readAsString(),
      );

      obj = Note(
        type: json['tipo'] as int,
        number: json['num'] as String,
        referencia: json['referencia'] as String,
        issue: json['asunto'] as String,
        publicationDate: json['fecha'] as int,
        url: json['url'] as String,
      );
    });

    test('can be instantiated', () {
      expect(obj, isNotNull);
    });

    test('supports value comparisons', () {
      expect(
          Note(
                type: 1,
                number: '1',
                referencia: '1',
                issue: '1',
                publicationDate: 1,
                url: '1',
              ) ==
              Note(
                type: 1,
                number: '1',
                referencia: '1',
                issue: '1',
                publicationDate: 1,
                url: '1',
              ),
          isTrue);
    });

    test('json serialization fromJson', () {
      expect(Note.fromJson(json), obj);
    });

    test('json serialization toJson', () {
      expect(obj.toJson(), json);
    });
  });
}
