import 'package:cima_model/cima_model.dart';
import 'package:test/test.dart';

void main() {
  group('Material', () {
    late Map<String, dynamic> json;
    late Material obj;

    setUp(() async {
      json = {
        "medicamento": "ALTELLUS",
        "principiosActivos": "EPINEFRINA",
        "listaDocsPaciente": [
          {
            "nombre": "INSTRUCCIONES DE USO PARA EL PACIENTE",
            "url": "https://cima.aemps.es/cima/DocsPub/16/1086",
            "fecha": 1625652934000
          },
          {
            "nombre": "INSTRUCCIONES DE USO (VIDEO)",
            "url":
                "https://www.youtube-nocookie.com/embed/co0v_S-Dbjw?rel=0&showinfo=0",
            "video": true,
            "fecha": 1625652934000
          }
        ],
        "listaDocsProfesional": [
          {
            "nombre": "LISTA DE VERIFICACIÓN",
            "url": "https://cima.aemps.es/cima/DocsPub/15/1042",
            "fecha": 1625652934000
          }
        ]
      };

      obj = Material.fromJson(json);
    });

    test('can be instantiated', () {
      expect(obj, isNotNull);
    });

    test('supports value comparisons', () {
      final title = 'ALTELLUS';
      final patientDocuments = [
        MaterialDocument(
            name: 'name',
            lastUpdate: DateTime.now(),
            url: Uri.parse('https://example.com')),
      ];
      final practitionerDocuments = [
        MaterialDocument(
            name: 'name',
            lastUpdate: DateTime.now(),
            url: Uri.parse('https://example.com')),
      ];
      expect(
          Material(
                title: title,
                patientDocuments: patientDocuments,
                practitionerDocuments: practitionerDocuments,
              ) ==
              Material(
                title: title,
                patientDocuments: patientDocuments,
                practitionerDocuments: practitionerDocuments,
              ),
          isTrue);
    });

    test('json serialization fromJson', () {
      expect(Material.fromJson(json), obj);
    });

    test('json serialization toJson', () {
      expect(obj.toJson(), json);
    });
  });
}
