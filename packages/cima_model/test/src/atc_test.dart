import 'package:cima_model/cima_model.dart';
import 'package:test/test.dart';

void main() {
  group('Atc', () {
    test('supports value comparisons', () {
      expect(
          Atc(codigo: '', nivel: 0, nombre: '') ==
              Atc(codigo: '', nivel: 0, nombre: ''),
          isTrue);
    });

    test('supports value comparisons', () {
      expect(
          Atc(codigo: '', nivel: 1, nombre: '') ==
              Atc(codigo: '', nivel: 0, nombre: ''),
          isFalse);
    });
  });
}
