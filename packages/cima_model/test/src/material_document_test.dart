import 'package:cima_model/cima_model.dart';
import 'package:test/test.dart';

void main() {
  group('DocumentoMaterial', () {
    late Map<String, dynamic> json;
    late MaterialDocument obj;

    final name = 'name';
    final url = Uri.parse('https://example.com');
    final date = DateTime.now();

    setUp(() async {
      json = {
        "nombre": "GUÍA DIRIGIDA AL PACIENTE",
        "url": "https://cima.aemps.es/cima/DocsPub/16/749",
        "fecha": 1508760303000
      };

      obj = MaterialDocument.fromJson(json);
    });

    test('can be instantiated', () {
      expect(obj, isNotNull);
    });

    test('supports value comparisons', () {
      expect(
          MaterialDocument(
                name: name,
                url: url,
                lastUpdate: date,
              ) ==
              MaterialDocument(
                name: name,
                url: url,
                lastUpdate: date,
              ),
          isTrue);
    });

    test('json serialization fromJson', () {
      expect(MaterialDocument.fromJson(json), obj);
    });

    test('json serialization toJson', () {
      expect(obj.toJson(), json);
    });
  });
}
