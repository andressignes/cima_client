import 'package:cima_model/cima_model.dart';
import 'package:test/test.dart';

void main() {
  group('CIMA Paginado', () {
    final cimaPaginadoObj = CimaPaginado(
      pagina: 1,
      resultados: [],
      tamanioPagina: 25,
      totalFilas: 201,
    );
    final cimaPaginadoJson = {
      "totalFilas": 201,
      "pagina": 1,
      "tamanioPagina": 25,
      "resultados": []
    };

    test('can be instantiated', () {
      expect(CimaPaginado(), isNotNull);
    });

    test('supports value comparisons', () {
      expect(
          CimaPaginado(
                pagina: 1,
                resultados: [],
                tamanioPagina: 25,
                totalFilas: 100,
              ) ==
              CimaPaginado(
                pagina: 1,
                resultados: [],
                tamanioPagina: 25,
                totalFilas: 100,
              ),
          isTrue);
    });

    test('json serialization fromJson', () {
      expect(CimaPaginado.fromJson(cimaPaginadoJson), cimaPaginadoObj);
    });

    test('json serialization toJson', () {
      expect(cimaPaginadoObj.toJson(), cimaPaginadoJson);
    });
  });
}
