import 'package:cima_model/cima_model.dart';
import 'package:test/test.dart';

void main() {
  group('Medicamento', () {
    late Map<String, dynamic> json;
    late Medication obj;

    setUpAll(() async {
      json = {
        "nregistro": "51347",
        "nombre": "ASPIRINA C 400 mg/240 mg COMPRIMIDOS EFERVESCENTES",
        "pactivos": "ACETILSALICILICO ACIDO, ASCORBICO ACIDO",
        "labtitular": "Bayer Hispania, S.L.",
        "cpresc": "Sin Receta",
        "estado": {"aut": 107737200000},
        "comerc": true,
        "receta": false,
        "generico": false,
        "conduc": false,
        "triangulo": false,
        "huerfano": false,
        "biosimilar": false,
        "nosustituible": {"id": 0, "nombre": "N/A"},
        "psum": true,
        "notas": false,
        "materialesInf": false,
        "ema": false,
        "docs": [
          {
            "tipo": 1,
            "url": "https://cima.aemps.es/cima/pdfs/ft/51347/FT_51347.pdf",
            "urlHtml":
                "https://cima.aemps.es/cima/dochtml/ft/51347/FT_51347.html",
            "secc": true,
            "fecha": 1642813267000
          },
          {
            "tipo": 2,
            "url": "https://cima.aemps.es/cima/pdfs/p/51347/P_51347.pdf",
            "urlHtml":
                "https://cima.aemps.es/cima/dochtml/p/51347/P_51347.html",
            "secc": true,
            "fecha": 1642813284000
          }
        ],
        "fotos": [
          {
            "tipo": "materialas",
            "url":
                "https://cima.aemps.es/cima/fotos/thumbnails/materialas/51347/51347_materialas.jpg",
            "fecha": 1519196603000
          },
          {
            "tipo": "formafarmac",
            "url":
                "https://cima.aemps.es/cima/fotos/thumbnails/formafarmac/51347/51347_formafarmac.jpg",
            "fecha": 1519196602000
          }
        ],
        "atcs": [
          {
            "codigo": "N02B",
            "nombre": "OTROS ANALGÉSICOS Y ANTIPIRÉTICOS",
            "nivel": 3
          },
          {
            "codigo": "N02BA",
            "nombre": "Ácido salicílico y derivados",
            "nivel": 4
          },
          {
            "codigo": "N02BA51",
            "nombre":
                "Ácido acetilsalicílico, combinaciones excluyendo psicolépticos",
            "nivel": 5
          }
        ],
        "principiosActivos": [
          {
            "id": 176,
            "codigo": "176A",
            "nombre": "ACETILSALICILICO ACIDO",
            "cantidad": "400",
            "unidad": "mg",
            "orden": 1
          },
          {
            "id": 61,
            "codigo": "61A",
            "nombre": "ASCORBICO ACIDO",
            "cantidad": "240",
            "unidad": "mg",
            "orden": 2
          }
        ],
        "excipientes": [
          {
            "id": 1833,
            "nombre": "HIDROGENOCARBONATO DE SODIO",
            "cantidad": "900",
            "unidad": "mg",
            "orden": 1
          },
          {
            "id": 18303,
            "nombre": "CARBONATO DE SODIO",
            "cantidad": "200",
            "unidad": "mg",
            "orden": 2
          },
          {
            "id": 2362,
            "nombre": "CITRATO DE SODIO (E-331)",
            "cantidad": "1242.0",
            "unidad": "mg",
            "orden": 9
          }
        ],
        "viasAdministracion": [
          {"id": 48, "nombre": "VÍA ORAL"}
        ],
        "presentaciones": [
          {
            "cn": "712729",
            "nombre":
                "ASPIRINA C 400 mg/240 mg COMPRIMIDOS EFERVESCENTES , 10 comprimidos",
            "estado": {"aut": 107737200000},
            "comerc": true,
            "psum": false
          }
        ],
        "formaFarmaceutica": {"id": 43, "nombre": "COMPRIMIDO EFERVESCENTE"},
        "formaFarmaceuticaSimplificada": {
          "id": 13,
          "nombre": "COMPRIMIDO EFERVESCENTE"
        },
        "vtm": {
          "id": 139011000140103,
          "nombre": "ácido acetilsalicílico + ácido ascórbico"
        },
        "dosis": "400/240 mg/mg"
      };

      obj = Medication.fromJson(json);
    });

    test('can be instantiated', () {
      expect(obj, isNotNull);
    });

    test('json serialization fromJson', () {
      expect(Medication.fromJson(json), obj);
    });

    test('json serialization toJson', () {
      expect(obj.toJson(), json);
    });

    group('getDocument', () {
      test('returns null if no document is found', () {
        expect(obj.getDocument(DocumentType.planGestionRiesgos), isNull);
      });

      test('returns the document if found', () {
        expect(obj.getDocument(DocumentType.fichaTecnica), isNotNull);
      });
    });

    group('getPhotoMaterial', () {
      test('returns the photo if found', () {
        expect(
            obj.photoMaterial,
            obj.photos
                ?.firstWhere((element) => element.type == PhotoType.material)
                .url);
      });
    });

    group('getPhotoPharmaceuticalProduct', () {
      test('returns the photo if found', () {
        expect(
            obj.photoPharmaceuticalProduct,
            obj.photos
                ?.firstWhere((element) =>
                    element.type == PhotoType.pharmaceuticalProduct)
                .url);
      });
    });
  });
}
