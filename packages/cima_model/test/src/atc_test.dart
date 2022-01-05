import 'package:cima_model/cima_model.dart';
import 'package:test/test.dart';

void main() {
  group('Atc', () {
    final atcJson = {
      "codigo": "N02B",
      "nombre": "OTROS ANALGÉSICOS Y ANTIPIRÉTICOS",
      "nivel": 3
    };

    final atcObj = Atc(
      nombre: 'OTROS ANALGÉSICOS Y ANTIPIRÉTICOS',
      codigo: 'N02B',
      nivel: 3,
    );

    test('can be instantiated', () {
      expect(atcObj, isNotNull);
    });

    test('supports value comparisons', () {
      expect(
          Atc(codigo: '', nivel: 0, nombre: '') ==
              Atc(codigo: '', nivel: 0, nombre: ''),
          isTrue);
    });

    test('json serialization fromJson', () {
      expect(Atc.fromJson(atcJson), atcObj);
    });

    test('json serialization toJson', () {
      expect(atcObj.toJson(), atcJson);
    });
  });
}
