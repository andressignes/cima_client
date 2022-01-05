import 'package:cima_model/cima_model.dart';
import 'package:test/test.dart';

void main() {
  group('Descripcion Clinica', () {
    late Map<String, dynamic> json;
    late DescripcionClinica obj;

    setUp(() {
      json = {
        "vmp": "322246006",
        "vmpDesc": "Paracetamol 100 mg/ml solución/suspensión oral",
        "vmpp": "18021000140104",
        "vmppDesc":
            "Paracetamol 100 mg/ml solución/suspensión oral 30 ml 1 frasco",
        "presComerc": 2
      };
      obj = DescripcionClinica(
        vmp: "322246006",
        vmpDesc: "Paracetamol 100 mg/ml solución/suspensión oral",
        vmpp: "18021000140104",
        vmppDesc:
            "Paracetamol 100 mg/ml solución/suspensión oral 30 ml 1 frasco",
        presComerc: 2,
      );
    });

    test('can be instantiated', () {
      expect(obj, isNotNull);
    });

    test('supports value comparisons', () {
      expect(),
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
