import 'package:cima_model/cima_model.dart';
import 'package:test/test.dart';

void main() {
  group('Problema Suministro', () {
    late Map<String, dynamic> json;
    late SupplyProblems obj;

    setUpAll(() async {
      json = {
        "cn": "997593",
        "nombre": "BACTROBAN 20 mg/g pomada , 1 tubo de 30 g",
        "fini": 1641769200000,
        "ffin": 1651010400000,
        "activo": true,
        "observ":
            "Existe/n otro/s medicamento/s con el mismo principio activo y para la misma vía de administración. "
      };

      obj = SupplyProblems.fromJson(json);
    });

    test('can be instantiated', () {
      expect(obj, isNotNull);
    });

    test('json serialization fromJson', () {
      expect(SupplyProblems.fromJson(json), obj);
    });

    test('json serialization toJson', () {
      expect(obj.toJson(), json);
    });
  });
}
