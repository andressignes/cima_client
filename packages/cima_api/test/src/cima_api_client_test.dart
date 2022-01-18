import 'dart:convert';
import 'dart:io';

import 'package:cima_api/cima_api.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockHttpClient extends Mock implements Client {}

void main() {
  group('CimaApiClient', () {
    late final Client client;

    const String baseUrl = 'cima.aemps.es';
    final jsonResponse =
        File('test/data/medicamento_cn_712729.json').readAsStringSync();
    setUpAll(() {
      client = MockHttpClient();
    });

    test('can be instantiated without client', () {
      expect(CimaApiClient(baseUrl: baseUrl), isNotNull);
    });

    test('can be instantiated with client', () {
      expect(
          CimaApiClient(
            httpClient: MockHttpClient(),
            baseUrl: baseUrl,
          ),
          isNotNull);
    });

    group('getMedicamento', () {
      test('get medication with valid cn', () async {
        final cn = '712729';
        final params = <String, String>{};
        params['cn'] = cn;

        when(
          () => client.get(Uri.https(
            baseUrl,
            '/cima/rest/medicamento',
            params,
          )),
        ).thenAnswer((_) async => Response(jsonEncode(jsonResponse), 200));
        final apiClient = CimaApiClient(
          httpClient: client,
          baseUrl: baseUrl,
        );
        final result = await apiClient.getMedicationByCN(cn);
        expect(result, isA<Response>());
        expect(result.statusCode, 200);
      });

      test('get medication with invalid cn', () async {
        final cn = 'fake';
        final params = <String, String>{};
        params['cn'] = cn;

        when(
          () => client.get(Uri.https(
            baseUrl,
            '/cima/rest/medicamento',
            params,
          )),
        ).thenAnswer((_) async => Response('', 204));
        final apiClient = CimaApiClient(
          httpClient: client,
          baseUrl: baseUrl,
        );
        final result = await apiClient.getMedicationByCN(cn);
        expect(result, isA<Response>());
        expect(result.statusCode, 204);
      });

      test('get medication by nregistro', () async {
        final nRegistro = '51347';
        final params = <String, String>{};
        params['nregistro'] = nRegistro;
        when(
          () => client.get(Uri.https(
            baseUrl,
            '/cima/rest/medicamento',
            params,
          )),
        ).thenAnswer((_) async => Response(jsonResponse, 200));
        final apiClient = CimaApiClient(
          httpClient: client,
          baseUrl: baseUrl,
        );
        final result = await apiClient.getMedicationByNRegistro(nRegistro);
        expect(result, isA<Response>());
        expect(result.statusCode, 200);
      });
    });

    group('getMedications', () {
      test('get medications without params', () async {
        final params = <String, String>{};
        when(
          () => client.get(Uri.https(
            baseUrl,
            '/cima/rest/medicamentos',
            params,
          )),
        ).thenAnswer((_) async => Response('', 204));
        final apiClient = CimaApiClient(
          httpClient: client,
          baseUrl: baseUrl,
        );
        final result = await apiClient.getMedications(params: params);
        expect(result, isA<Response>());
        expect(result.statusCode, 204);
      });

      test('get medications with params', () async {
        final params = <String, String>{};
        params['nombre'] = 'paracetamol';
        when(
          () => client.get(Uri.https(
            baseUrl,
            '/cima/rest/medicamentos',
            params,
          )),
        ).thenAnswer((_) async => Response('', 200));

        final apiClient = CimaApiClient(
          httpClient: client,
          baseUrl: baseUrl,
        );
        final result = await apiClient.getMedications(params: params);
        expect(result, isA<Response>());
        expect(result.statusCode, 200);
      });
    });

    group('getProblemasSuministro', () {
      test('get Problemas Suministro', () async {
        final params = <String, String>{};
        when(
          () => client.get(Uri.https(
            baseUrl,
            '/cima/rest/psuministro',
            params,
          )),
        ).thenAnswer((_) async => Response('', 200));
        final apiClient = CimaApiClient(
          httpClient: client,
          baseUrl: baseUrl,
        );
        final result = await apiClient.getProblemasSuministro(params: params);
        expect(result, isA<Response>());
        expect(result.statusCode, 200);
      });
    });
  });
}
