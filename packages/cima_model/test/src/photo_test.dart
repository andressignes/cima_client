import 'package:cima_model/cima_model.dart';
import 'package:test/test.dart';

void main() {
  group('Photo', () {
    late Map<String, dynamic> json;
    late Photo obj;
    final PhotoType type = PhotoType.material;
    final url = Uri.parse('https://www.cima.aemps.es/cima/rest/ficheros/1');
    final date = DateTime(2021, 1, 1);

    setUp(() async {
      json = {
        "tipo": "materialas",
        "url":
            "https://cima.aemps.es/cima/fotos/thumbnails/materialas/51347/51347_materialas.jpg",
        "fecha": 1519196603000
      };

      obj = Photo.fromJson(json);
    });

    test('can be instantiated', () {
      expect(obj, isNotNull);
    });

    test('supports value comparisons', () {
      expect(
          Photo(
                type: type,
                url: url,
                latestUpdate: date,
              ) ==
              Photo(
                type: type,
                url: url,
                latestUpdate: date,
              ),
          isTrue);
    });

    test('json serialization fromJson', () {
      expect(Photo.fromJson(json), obj);
    });

    test('json serialization toJson', () {
      expect(obj.toJson(), json);
    });
  });
}
