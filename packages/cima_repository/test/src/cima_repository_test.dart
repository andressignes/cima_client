import 'dart:convert';
import 'dart:io';

import 'package:cima_api/cima_api.dart';
import 'package:cima_model/cima_model.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockCimaApiClient extends Mock implements CimaApiClient {}

void main() {
  group('CIMA Repository', () {
    late final MockCimaApiClient apiClient;
    setUpAll(() {
      apiClient = MockCimaApiClient();
    });

    test('instantiate repository', () {
      expect(CimaRepository(remoteDataSource: apiClient), isNotNull);
    });

    group('getMedicamento', () {
      test('without parameters', () async {
        final repository = CimaRepository(remoteDataSource: apiClient);
        final medication = await repository.getMedicamento();
        expect(medication, Left(ServerFailure()));
      });

      test('get by CN', () async {
        final String cn = '712729';
        final medicamentoJson = {
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
        when(() => apiClient.getMedicationByCN(cn)).thenAnswer(
            (_) async => Response(json.encode(medicamentoJson), 200));

        final repository = CimaRepository(remoteDataSource: apiClient);
        final result = await repository.getMedicamento(cn: cn);
        expect(result, Right(Medicamento.fromJson(medicamentoJson)));
      });

      test('get by nRegistro', () async {
        final String nRegistro = '51347';
        final medicamentoJson = {
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
            },
            {
              "cn": "651877",
              "nombre":
                  "ASPIRINA C 400 mg/240 mg COMPRIMIDOS EFERVESCENTES , 20 comprimidos",
              "estado": {"aut": 830901600000},
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
        when(() => apiClient.getMedicationByNRegistro(nRegistro)).thenAnswer(
            (_) async => Response(jsonEncode(medicamentoJson), 200));

        final repository = CimaRepository(remoteDataSource: apiClient);
        final result = await repository.getMedicamento(nregistro: nRegistro);
        expect(result, Right(Medicamento.fromJson(medicamentoJson)));
      });
    });

    group('Find Medication', () {
      late Map<String, String> params;

      setUp(() async {
        params = {'nombre': 'aspirina'};
      });
      test('find without params', () async {
        when(() => apiClient.getMedications(params: null))
            .thenAnswer((_) async => Response('', 204));
        final repository = CimaRepository(remoteDataSource: apiClient);
        final result = await repository.findMedications();
        expect(result, Left(NoDataFailure()));
      });

      test('find by name', () async {
        late final String medicamentoRAW;
        late final Map<String, dynamic> medicamentoJson;
        late final List<Medicamento> listMedicamentos;
        medicamentoRAW =
            await File('test/data/medicamento.json').readAsString();
        medicamentoJson = jsonDecode(medicamentoRAW);
        listMedicamentos = (medicamentoJson['resultados'] as List)
            .map((m) => Medicamento.fromJson(m))
            .toList();

        when(() => apiClient.getMedications(params: params))
            .thenAnswer((_) async => Response(medicamentoRAW, 200));

        final repository = CimaRepository(remoteDataSource: apiClient);
        final result = await repository.findMedications(params: params);
        expect(result.isRight(), true);
        expect(
            result.fold(
              (_) => null,
              (r) => r,
            ),
            listMedicamentos);
      });
    });

    group('Find Problemas suministro', () {
      test('find problemas suministro without params', () async {
        final problemasSuministroRaw =
            await File('test/data/problemas_suministro.json').readAsString();
        final problemasSuministroJson = jsonDecode(problemasSuministroRaw);
        final cimaPaginado = CimaPaginado.fromJson(problemasSuministroJson);
        final problemasSuministro = cimaPaginado.resultados!
            .map((e) => ProblemaSuministro.fromJson(e))
            .toList();

        when(() => apiClient.getProblemasSuministro(params: {}))
            .thenAnswer((_) async => Response(problemasSuministroRaw, 200));

        final repository = CimaRepository(remoteDataSource: apiClient);
        final result = await repository.findProblemasSuministro(params: {});
        expect(result.isRight(), true);
        expect(result.fold((_) => null, (r) => r), problemasSuministro);
      });

      test('find with params', () async {
        final params = {'nombre': 'aspirina'};
        final problemasSuministroRaw =
            await File('test/data/problemas_suministro.json').readAsString();
        final problemasSuministroJson = jsonDecode(problemasSuministroRaw);
        final cimaPaginado = CimaPaginado.fromJson(problemasSuministroJson);
        final problemasSuministro = cimaPaginado.resultados!
            .map((e) => ProblemaSuministro.fromJson(e))
            .toList();
        when(() => apiClient.getProblemasSuministro(params: params))
            .thenAnswer((_) async => Response(problemasSuministroRaw, 200));
        final repository = CimaRepository(remoteDataSource: apiClient);
        final result = await repository.findProblemasSuministro(params: params);
        expect(result.isRight(), true);
        expect(
            result.fold(
              (l) => null,
              (r) => r,
            ),
            problemasSuministro);
      });
    });
  });
}
