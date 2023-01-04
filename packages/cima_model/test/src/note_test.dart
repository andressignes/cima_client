import 'package:cima_model/cima_model.dart';
import 'package:test/test.dart';

void main() {
  group('Note', () {
    late Map<String, dynamic> json;
    late Note obj;

    final noteType = NoteType.securityNote;
    final number = 'Informe FV vacunas';
    final reference = 'Informe FV vacunas 11';
    final issue =
        'Vacunas COVID-19 Informe de farmacovigilancia AEMPS Nº 11-diciembre 2021';
    final date = DateTime(2021, 12, 22);
    final url = Uri.parse(
        'https://www.aemps.gob.es/informa/boletines-aemps/boletin-fv/2021-boletin-fv/11o-informe-de-farmacovigilancia-sobre-vacunas-covid-19/');

    setUp(() async {
      json = {
        "tipo": 1,
        "num": "Informe FV vacunas",
        "referencia": "Informe FV vacunas 11",
        "asunto":
            "Vacunas COVID-19 Informe de farmacovigilancia AEMPS Nº 11-diciembre 2021",
        "fecha": 1639954800000,
        "url":
            "https://www.aemps.gob.es/informa/boletines-aemps/boletin-fv/2021-boletin-fv/11o-informe-de-farmacovigilancia-sobre-vacunas-covid-19/"
      };

      obj = Note.fromJson(json);
    });

    test('can be instantiated', () {
      expect(obj, isNotNull);
    });

    test('supports value comparisons', () {
      expect(
          Note(
                type: noteType,
                number: number,
                reference: reference,
                issue: issue,
                publicationDate: date,
                url: url,
              ) ==
              Note(
                type: noteType,
                number: number,
                reference: reference,
                issue: issue,
                publicationDate: date,
                url: url,
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
