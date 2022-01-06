import 'package:cima_api/cima_api.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockHttpClient extends Mock implements Client {}

void main() {
  group('CimaApiClient', () {
    late final Client client;
    final String baseUrl = 'cima.aemps.es';
    setUpAll(() {
      client = MockHttpClient();
    });

    test('can be instantiated', () {
      expect(
          CimaApiClient(
            httpClient: MockHttpClient(),
            baseUrl: baseUrl,
          ),
          isNotNull);
    });

    group('getMedicamento', () {
      test('get medication', () async {
        final params = <String, String>{};
        when(
          () => client.get(Uri.https(
            baseUrl,
            '/cima/rest/medicamento',
            params,
          )),
        ).thenAnswer((_) async => Response('', 200));
        final apiClient = CimaApiClient(
          httpClient: client,
          baseUrl: baseUrl,
        );
        final result = await apiClient.getMedicamento();
        expect(result, isNotNull);
      });
      test('get medication by CN', () async {
        final params = <String, String>{};
        params['cn'] = '712729';
        final jsonResponse = {
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
          "psum": false,
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
              "fecha": 1628287030000
            },
            {
              "tipo": 2,
              "url": "https://cima.aemps.es/cima/pdfs/p/51347/P_51347.pdf",
              "urlHtml":
                  "https://cima.aemps.es/cima/dochtml/p/51347/P_51347.html",
              "secc": true,
              "fecha": 1628287041000
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
              "id": 475,
              "nombre": "HIDROGENO CARBONATO DE SODIO",
              "cantidad": "900",
              "unidad": "mg",
              "orden": 1
            },
            {
              "id": 2100,
              "nombre": "CARBONATO DE SODIO ANHIDRO",
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
        when(
          () => client.get(Uri.https(
            baseUrl,
            '/cima/rest/medicamento',
            params,
          )),
        ).thenAnswer((_) async => Response(jsonResponse.toString(), 200));
        final apiClient = CimaApiClient(
          httpClient: client,
          baseUrl: baseUrl,
        );
        final result = await apiClient.getMedicamento();
        expect(result.body == jsonResponse.toString(), isTrue);
      });
    });
  });
}
