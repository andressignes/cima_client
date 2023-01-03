import 'dart:convert';
import 'dart:io';

import 'package:cima_model/cima_model.dart';
import 'package:test/test.dart';

void main() {
  group('Documento', () {
    late Map<String, dynamic> json;
    late Document obj;

    setUp(() async {
      json = jsonDecode(
        await File('test/resources/documento.json').readAsString(),
      );

      obj = Document(
        type: DocumentType.fichaTecnica,
        url: json['url'] as String,
        htmlAvailable: json['secc'] as bool,
      );
    });

    test('can be instantiated', () {
      expect(obj, isNotNull);
    });

    test('supports value comparisons', () {
      expect(
          Document(
                type: DocumentType.fichaTecnica,
                url: "",
                htmlAvailable: true,
              ) ==
              Document(
                type: DocumentType.fichaTecnica,
                url: "",
                htmlAvailable: true,
              ),
          isTrue);
    });

    test('json serialization fromJson', () {
      expect(Document.fromJson(json), obj);
    });

    test('json serialization toJson', () {
      expect(obj.toJson(), json);
    });
  });
}
