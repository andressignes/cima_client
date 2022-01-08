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
        final jsonResult = {
          "totalFilas": 16,
          "pagina": 1,
          "tamanioPagina": 25,
          "resultados": [
            {
              "nregistro": "51347",
              "nombre": "ASPIRINA C 400 mg/240 mg COMPRIMIDOS EFERVESCENTES",
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
                  "url":
                      "https://cima.aemps.es/cima/pdfs/ft/51347/FT_51347.pdf",
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
              "viasAdministracion": [
                {"id": 48, "nombre": "VÍA ORAL"}
              ],
              "formaFarmaceutica": {
                "id": 43,
                "nombre": "COMPRIMIDO EFERVESCENTE"
              },
              "formaFarmaceuticaSimplificada": {
                "id": 13,
                "nombre": "COMPRIMIDO EFERVESCENTE"
              },
              "vtm": {
                "id": 139011000140103,
                "nombre": "ácido acetilsalicílico + ácido ascórbico"
              },
              "dosis": "400/240 mg/mg"
            },
            {
              "nregistro": "62280",
              "nombre": "ASPIRINA COMPLEX GRANULADO EFERVESCENTE",
              "labtitular": "Bayer Hispania, S.L.",
              "cpresc": "Sin Receta",
              "estado": {"aut": 909874800000},
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
                  "url":
                      "https://cima.aemps.es/cima/pdfs/ft/62280/FT_62280.pdf",
                  "urlHtml":
                      "https://cima.aemps.es/cima/dochtml/ft/62280/FT_62280.html",
                  "secc": true,
                  "fecha": 1611963763000
                },
                {
                  "tipo": 2,
                  "url": "https://cima.aemps.es/cima/pdfs/p/62280/P_62280.pdf",
                  "urlHtml":
                      "https://cima.aemps.es/cima/dochtml/p/62280/P_62280.html",
                  "secc": true,
                  "fecha": 1606954546000
                }
              ],
              "fotos": [
                {
                  "tipo": "materialas",
                  "url":
                      "https://cima.aemps.es/cima/fotos/thumbnails/materialas/62280/62280_materialas.jpg",
                  "fecha": 1530541911000
                },
                {
                  "tipo": "formafarmac",
                  "url":
                      "https://cima.aemps.es/cima/fotos/thumbnails/formafarmac/62280/62280_formafarmac.jpg",
                  "fecha": 1530541912000
                }
              ],
              "viasAdministracion": [
                {"id": 48, "nombre": "VÍA ORAL"}
              ],
              "formaFarmaceutica": {
                "id": 27,
                "nombre": "GRANULADO EFERVESCENTE"
              },
              "formaFarmaceuticaSimplificada": {
                "id": 44,
                "nombre": "SOLUCIÓN/SUSPENSIÓN ORAL EFERVESCENTE"
              },
              "vtm": {
                "id": 139071000140108,
                "nombre": "ácido acetilsalicílico + clorfenamina + fenilefrina"
              },
              "dosis": "500 mg"
            },
            {
              "nregistro": "12680",
              "nombre": "ASPIRINA PLUS 500 mg/ 50 mg COMPRIMIDOS",
              "labtitular": "Bayer Hispania, S.L.",
              "cpresc": "Sin Receta",
              "estado": {"aut": -639108000000},
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
                  "url":
                      "https://cima.aemps.es/cima/pdfs/ft/12680/FT_12680.pdf",
                  "urlHtml":
                      "https://cima.aemps.es/cima/dochtml/ft/12680/FT_12680.html",
                  "secc": true,
                  "fecha": 1613691993000
                },
                {
                  "tipo": 2,
                  "url": "https://cima.aemps.es/cima/pdfs/p/12680/P_12680.pdf",
                  "urlHtml":
                      "https://cima.aemps.es/cima/dochtml/p/12680/P_12680.html",
                  "secc": true,
                  "fecha": 1613692005000
                }
              ],
              "fotos": [
                {
                  "tipo": "materialas",
                  "url":
                      "https://cima.aemps.es/cima/fotos/thumbnails/materialas/12680/12680_materialas.jpg",
                  "fecha": 1519196703000
                },
                {
                  "tipo": "formafarmac",
                  "url":
                      "https://cima.aemps.es/cima/fotos/thumbnails/formafarmac/12680/12680_formafarmac.jpg",
                  "fecha": 1519196702000
                }
              ],
              "viasAdministracion": [
                {"id": 48, "nombre": "VÍA ORAL"}
              ],
              "formaFarmaceutica": {"id": 40, "nombre": "COMPRIMIDO"},
              "formaFarmaceuticaSimplificada": {
                "id": 10,
                "nombre": "COMPRIMIDO"
              },
              "vtm": {
                "id": 412569008,
                "nombre": "ácido acetilsalicílico + cafeína"
              },
              "dosis": "500/50 mg/mg"
            },
            {
              "nregistro": "2011",
              "nombre": "ASPIRINA 500 mg COMPRIMIDOS",
              "labtitular": "Bayer Hispania, S.L.",
              "cpresc": "Sin Receta",
              "estado": {"aut": -1499126400000},
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
                  "url": "https://cima.aemps.es/cima/pdfs/ft/2011/FT_2011.pdf",
                  "urlHtml":
                      "https://cima.aemps.es/cima/dochtml/ft/2011/FT_2011.html",
                  "secc": true,
                  "fecha": 1606954406000
                },
                {
                  "tipo": 2,
                  "url": "https://cima.aemps.es/cima/pdfs/p/2011/P_2011.pdf",
                  "urlHtml":
                      "https://cima.aemps.es/cima/dochtml/p/2011/P_2011.html",
                  "secc": true,
                  "fecha": 1606954430000
                }
              ],
              "fotos": [
                {
                  "tipo": "materialas",
                  "url":
                      "https://cima.aemps.es/cima/fotos/thumbnails/materialas/2011/2011_materialas.jpg",
                  "fecha": 1519196508000
                },
                {
                  "tipo": "formafarmac",
                  "url":
                      "https://cima.aemps.es/cima/fotos/thumbnails/formafarmac/2011/2011_formafarmac.jpg",
                  "fecha": 1519196507000
                }
              ],
              "viasAdministracion": [
                {"id": 48, "nombre": "VÍA ORAL"}
              ],
              "formaFarmaceutica": {"id": 40, "nombre": "COMPRIMIDO"},
              "formaFarmaceuticaSimplificada": {
                "id": 10,
                "nombre": "COMPRIMIDO"
              },
              "vtm": {"id": 7947003, "nombre": "ácido acetilsalicílico"},
              "dosis": "500 mg"
            },
            {
              "nregistro": "67268",
              "nombre": "ASPIRINA 500 mg COMPRIMIDOS EFERVESCENTES",
              "labtitular": "Bayer Hispania, S.L.",
              "cpresc": "Sin Receta",
              "estado": {"aut": 1132700400000},
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
                  "url":
                      "https://cima.aemps.es/cima/pdfs/ft/67268/FT_67268.pdf",
                  "urlHtml":
                      "https://cima.aemps.es/cima/dochtml/ft/67268/FT_67268.html",
                  "secc": true,
                  "fecha": 1606954638000
                },
                {
                  "tipo": 2,
                  "url": "https://cima.aemps.es/cima/pdfs/p/67268/P_67268.pdf",
                  "urlHtml":
                      "https://cima.aemps.es/cima/dochtml/p/67268/P_67268.html",
                  "secc": true,
                  "fecha": 1606954655000
                }
              ],
              "fotos": [
                {
                  "tipo": "materialas",
                  "url":
                      "https://cima.aemps.es/cima/fotos/thumbnails/materialas/67268/67268_materialas.jpg",
                  "fecha": 1519196540000
                },
                {
                  "tipo": "formafarmac",
                  "url":
                      "https://cima.aemps.es/cima/fotos/thumbnails/formafarmac/67268/67268_formafarmac.jpg",
                  "fecha": 1519196540000
                }
              ],
              "viasAdministracion": [
                {"id": 48, "nombre": "VÍA ORAL"}
              ],
              "formaFarmaceutica": {
                "id": 43,
                "nombre": "COMPRIMIDO EFERVESCENTE"
              },
              "formaFarmaceuticaSimplificada": {
                "id": 13,
                "nombre": "COMPRIMIDO EFERVESCENTE"
              },
              "vtm": {"id": 7947003, "nombre": "ácido acetilsalicílico"},
              "dosis": "500 mg"
            },
            {
              "nregistro": "67875",
              "nombre": "ASPIRINA 500 mg GRANULADO",
              "labtitular": "Bayer Hispania, S.L.",
              "cpresc": "Sin Receta",
              "estado": {"aut": 1150668000000},
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
                  "url":
                      "https://cima.aemps.es/cima/pdfs/ft/67875/FT_67875.pdf",
                  "urlHtml":
                      "https://cima.aemps.es/cima/dochtml/ft/67875/FT_67875.html",
                  "secc": true,
                  "fecha": 1606954728000
                },
                {
                  "tipo": 2,
                  "url": "https://cima.aemps.es/cima/pdfs/p/67875/P_67875.pdf",
                  "urlHtml":
                      "https://cima.aemps.es/cima/dochtml/p/67875/P_67875.html",
                  "secc": true,
                  "fecha": 1606954747000
                }
              ],
              "fotos": [
                {
                  "tipo": "materialas",
                  "url":
                      "https://cima.aemps.es/cima/fotos/thumbnails/materialas/67875/67875_materialas.jpg",
                  "fecha": 1519196568000
                },
                {
                  "tipo": "formafarmac",
                  "url":
                      "https://cima.aemps.es/cima/fotos/thumbnails/formafarmac/67875/67875_formafarmac.jpg",
                  "fecha": 1519196567000
                }
              ],
              "viasAdministracion": [
                {"id": 48, "nombre": "VÍA ORAL"}
              ],
              "formaFarmaceutica": {"id": 26, "nombre": "GRANULADO"},
              "formaFarmaceuticaSimplificada": {
                "id": 93,
                "nombre": "SOLUCIÓN/SUSPENSIÓN ORAL"
              },
              "vtm": {"id": 7947003, "nombre": "ácido acetilsalicílico"},
              "dosis": "500 mg"
            },
            {
              "nregistro": "8701",
              "nombre": "CAFIASPIRINA 500 mg/50 mg COMPRIMIDOS",
              "labtitular": "Bayer Hispania, S.L.",
              "cpresc": "Sin Receta",
              "estado": {"aut": -1356998400000},
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
                  "url": "https://cima.aemps.es/cima/pdfs/ft/8701/FT_8701.pdf",
                  "urlHtml":
                      "https://cima.aemps.es/cima/dochtml/ft/8701/FT_8701.html",
                  "secc": true,
                  "fecha": 1626133272000
                },
                {
                  "tipo": 2,
                  "url": "https://cima.aemps.es/cima/pdfs/p/8701/P_8701.pdf",
                  "urlHtml":
                      "https://cima.aemps.es/cima/dochtml/p/8701/P_8701.html",
                  "secc": true,
                  "fecha": 1626133321000
                }
              ],
              "fotos": [
                {
                  "tipo": "materialas",
                  "url":
                      "https://cima.aemps.es/cima/fotos/thumbnails/materialas/8701/8701_materialas.jpg",
                  "fecha": 1519196926000
                },
                {
                  "tipo": "formafarmac",
                  "url":
                      "https://cima.aemps.es/cima/fotos/thumbnails/formafarmac/8701/8701_formafarmac.jpg",
                  "fecha": 1519196925000
                }
              ],
              "viasAdministracion": [
                {"id": 48, "nombre": "VÍA ORAL"}
              ],
              "formaFarmaceutica": {"id": 40, "nombre": "COMPRIMIDO"},
              "formaFarmaceuticaSimplificada": {
                "id": 10,
                "nombre": "COMPRIMIDO"
              },
              "vtm": {
                "id": 412569008,
                "nombre": "ácido acetilsalicílico + cafeína"
              },
              "dosis": "500 mg/50 mg"
            },
            {
              "nregistro": "57838",
              "nombre": "ASPIRINA 500 mg COMPRIMIDOS MASTICABLES",
              "labtitular": "Bayer Hispania, S.L.",
              "cpresc": "Sin Receta",
              "estado": {"aut": 612655200000, "rev": 1489058185000},
              "comerc": false,
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
                  "url":
                      "https://cima.aemps.es/cima/pdfs/ft/57838/FT_57838.pdf",
                  "urlHtml":
                      "https://cima.aemps.es/cima/dochtml/ft/57838/FT_57838.html",
                  "secc": true,
                  "fecha": 1436394454000
                },
                {
                  "tipo": 2,
                  "url": "https://cima.aemps.es/cima/pdfs/p/57838/P_57838.pdf",
                  "urlHtml":
                      "https://cima.aemps.es/cima/dochtml/p/57838/P_57838.html",
                  "secc": true,
                  "fecha": 1436394454000
                }
              ],
              "viasAdministracion": [
                {"id": 48, "nombre": "VÍA ORAL"}
              ],
              "formaFarmaceutica": {
                "id": 49,
                "nombre": "COMPRIMIDO MASTICABLE"
              },
              "formaFarmaceuticaSimplificada": {
                "id": 15,
                "nombre": "COMPRIMIDO MASTICABLE"
              },
              "vtm": {"id": 7947003, "nombre": "ácido acetilsalicílico"},
              "dosis": "500 mg"
            },
            {
              "nregistro": "4554",
              "nombre": "ASPIRINA C COMPRIMIDOS EFERVESCENTES",
              "labtitular": "Bayer Hellas Abee",
              "cpresc": "Medicamento Sujeto A Prescripción Médica",
              "estado": {"aut": 1269986400000},
              "comerc": false,
              "receta": true,
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
              "docs": [],
              "viasAdministracion": [
                {"id": 48, "nombre": "VÍA ORAL"}
              ],
              "formaFarmaceutica": {
                "id": 43,
                "nombre": "COMPRIMIDO EFERVESCENTE"
              },
              "formaFarmaceuticaSimplificada": {
                "id": 13,
                "nombre": "COMPRIMIDO EFERVESCENTE"
              },
              "vtm": {
                "id": 139011000140103,
                "nombre": "ácido acetilsalicílico + ácido ascórbico"
              },
              "dosis": "400/240 mg/mg"
            },
            {
              "nregistro": "20000836",
              "nombre": "ASPIRINA C 400 MG/240 MG COMPRIMIDOS EFERVESCENTES",
              "labtitular": "Bayer Bulgaria Eood",
              "cpresc": "Sin Receta",
              "estado": {"aut": 1561985611000},
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
              "docs": [],
              "viasAdministracion": [
                {"id": 48, "nombre": "VÍA ORAL"}
              ],
              "formaFarmaceutica": {
                "id": 43,
                "nombre": "COMPRIMIDO EFERVESCENTE"
              },
              "formaFarmaceuticaSimplificada": {
                "id": 13,
                "nombre": "COMPRIMIDO EFERVESCENTE"
              },
              "vtm": {
                "id": 139011000140103,
                "nombre": "ácido acetilsalicílico + ácido ascórbico"
              },
              "dosis": "400 MG/240 MG"
            },
            {
              "nregistro": "2888001",
              "nombre": "ASPIRINA C 400 MG/240 MG COMPRIMIDOS EFERVESCENTES",
              "labtitular": "Bayer Hellas S.A.",
              "cpresc": "Sin Receta",
              "estado": {"aut": 1513693467000},
              "comerc": false,
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
                  "tipo": 2,
                  "url":
                      "https://cima.aemps.es/cima/pdfs/p/2888001/P_2888001.pdf",
                  "secc": false,
                  "fecha": 1513069295000
                }
              ],
              "viasAdministracion": [
                {"id": 48, "nombre": "VÍA ORAL"}
              ],
              "formaFarmaceutica": {
                "id": 43,
                "nombre": "COMPRIMIDO EFERVESCENTE"
              },
              "formaFarmaceuticaSimplificada": {
                "id": 13,
                "nombre": "COMPRIMIDO EFERVESCENTE"
              },
              "vtm": {
                "id": 139011000140103,
                "nombre": "ácido acetilsalicílico + ácido ascórbico"
              },
              "dosis": "400 mg/240 mg"
            },
            {
              "nregistro": "20000836IP",
              "nombre": "ASPIRINA C 400 mg/240 mg COMPRIMIDOS EFERVESCENTES",
              "labtitular": "Bayer Bulgaria Eood",
              "cpresc": "Sin Receta",
              "estado": {"aut": 1619706059000},
              "comerc": false,
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
              "docs": [],
              "viasAdministracion": [
                {"id": 48, "nombre": "VÍA ORAL"}
              ],
              "formaFarmaceutica": {
                "id": 43,
                "nombre": "COMPRIMIDO EFERVESCENTE"
              },
              "formaFarmaceuticaSimplificada": {
                "id": 13,
                "nombre": "COMPRIMIDO EFERVESCENTE"
              },
              "vtm": {
                "id": 139011000140103,
                "nombre": "ácido acetilsalicílico + ácido ascórbico"
              },
              "dosis": "400 mg/240 mg"
            },
            {
              "nregistro": "13738",
              "nombre": "ASPIRINA COMPRIMIDOS",
              "labtitular": "Bayer Hellas Abee",
              "cpresc": "Sin Receta",
              "estado": {"aut": 1270504800000},
              "comerc": false,
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
              "docs": [],
              "viasAdministracion": [
                {"id": 48, "nombre": "VÍA ORAL"}
              ],
              "formaFarmaceutica": {"id": 40, "nombre": "COMPRIMIDO"},
              "formaFarmaceuticaSimplificada": {
                "id": 10,
                "nombre": "COMPRIMIDO"
              },
              "vtm": {"id": 7947003, "nombre": "ácido acetilsalicílico"},
              "dosis": "500 mg"
            },
            {
              "nregistro": "40 400-95-96",
              "nombre": "ASPIRINA COMPRIMIDOS",
              "labtitular": "Bayer Hellas Abee",
              "cpresc": "Sin Receta",
              "estado": {"aut": 1031522400000},
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
                  "tipo": 2,
                  "url":
                      "https://cima.aemps.es/cima/pdfs/p/40+400-95-96/P_40+400-95-96.pdf",
                  "secc": false,
                  "fecha": 1272789852000
                }
              ],
              "viasAdministracion": [
                {"id": 48, "nombre": "VÍA ORAL"}
              ],
              "formaFarmaceutica": {"id": 40, "nombre": "COMPRIMIDO"},
              "formaFarmaceuticaSimplificada": {
                "id": 10,
                "nombre": "COMPRIMIDO"
              },
              "vtm": {"id": 7947003, "nombre": "ácido acetilsalicílico"},
              "dosis": "500 mg"
            },
            {
              "nregistro": "0416703",
              "nombre": "ASPIRINA 500 MG COMPRIMIDOS",
              "labtitular": "Bayer Hellas Abee",
              "cpresc": "Sin Receta",
              "estado": {"aut": 1496145449000},
              "comerc": false,
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
                  "tipo": 2,
                  "url":
                      "https://cima.aemps.es/cima/pdfs/p/0416703/P_0416703.pdf",
                  "secc": false,
                  "fecha": 1510838359000
                }
              ],
              "viasAdministracion": [
                {"id": 48, "nombre": "VÍA ORAL"}
              ],
              "formaFarmaceutica": {"id": 40, "nombre": "COMPRIMIDO"},
              "formaFarmaceuticaSimplificada": {
                "id": 10,
                "nombre": "COMPRIMIDO"
              },
              "vtm": {"id": 7947003, "nombre": "ácido acetilsalicílico"},
              "dosis": "500 mg"
            },
            {
              "nregistro": "95-0312",
              "nombre": "ASPIRINA 500MG COMPRIMIDOS",
              "labtitular": "Uab Bayer",
              "cpresc": "Sin Receta",
              "estado": {"aut": 1476114921000},
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
                  "tipo": 2,
                  "url":
                      "https://cima.aemps.es/cima/pdfs/p/95-0312/P_95-0312.pdf",
                  "secc": false,
                  "fecha": 1510838588000
                }
              ],
              "viasAdministracion": [
                {"id": 48, "nombre": "VÍA ORAL"}
              ],
              "formaFarmaceutica": {"id": 40, "nombre": "COMPRIMIDO"},
              "formaFarmaceuticaSimplificada": {
                "id": 10,
                "nombre": "COMPRIMIDO"
              },
              "vtm": {"id": 7947003, "nombre": "ácido acetilsalicílico"},
              "dosis": "500 mg"
            }
          ]
        };
        final listMedicamentos = (jsonResult['resultados'] as List)
            .map((m) => Medicamento.fromJson(m))
            .toList();
        when(() => apiClient.getMedications(params: params))
            .thenAnswer((_) async => Response(jsonEncode(jsonResult), 200));
        final repository = CimaRepository(remoteDataSource: apiClient);
        final result = await repository.findMedications(params: params);
        expect(result, Right(listMedicamentos));
      });
    });
  });
}
