import 'package:cima_api/cima_api.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockHttpClient extends Mock implements Client {}

void main() {
  group('CimaApiClient', () {
    late final Client client;
    final String baseUrl = 'http://localhost:8080';
    setUp(() {
      client = MockHttpClient();
    });

    test('can be instantiated', () {
      expect(CimaApiClient(httpClient: client, baseUrl: baseUrl), isNotNull);
    });

    group('getCima', () {
      test('should return a Cima', () async {
        // TODO
      });
    });
  });
}
