import 'package:cima_model/cima_model.dart';
import 'package:test/test.dart';

void main() {
  group('Document', () {
    late Map<String, dynamic> json;
    late Document obj;

    setUp(() async {
      json = {
        "tipo": 1,
        "url": "https://cima.aemps.es/cima/pdfs/ft/72112/FT_72112.pdf",
        "secc": true,
      };

      obj = Document.fromJson(json);
    });

    test('can be instantiated', () {
      expect(obj, isNotNull);
    });

    test('supports value comparisons', () {
      final type = DocumentType.fichaTecnica;
      final url = "https://cima.aemps.es/cima/pdfs/ft/72112/FT_72112.pdf";
      final htmlAvailable = true;
      final lastModified = DateTime.now();
      final urlHtml = "https://cima.aemps.es/cima/pdfs/ft/72112/FT_72112.html";
      expect(
          Document(
                type: type,
                url: url,
                htmlAvailable: htmlAvailable,
                lastModified: lastModified,
                urlHtml: urlHtml,
              ) ==
              Document(
                type: type,
                url: url,
                htmlAvailable: htmlAvailable,
                lastModified: lastModified,
                urlHtml: urlHtml,
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
