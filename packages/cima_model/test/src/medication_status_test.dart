import 'package:cima_model/cima_model.dart';
import 'package:test/test.dart';

void main() {
  group('MedicationStatus', () {
    late Map<String, dynamic> json;
    late MedicationStatus obj;

    const dateEpoch = 1428530400000;
    final date = DateTime.fromMillisecondsSinceEpoch(dateEpoch);

    setUp(() async {
      json = {
        "aut": 1428530400000,
        "susp": 1428530400000,
        "rev": 1428530400000
      };

      obj = MedicationStatus.fromJson(json);
    });

    test('can be instantiated', () {
      expect(obj, isNotNull);
    });

    test('supports value comparisons', () {
      expect(
          MedicationStatus(
                authorizationDate: date,
                revocationDate: date,
                suspensionDate: date,
              ) ==
              MedicationStatus(
                authorizationDate: date,
                revocationDate: date,
                suspensionDate: date,
              ),
          isTrue);
    });

    test('json serialization fromJson', () {
      expect(MedicationStatus.fromJson(json), obj);
    });

    test('json serialization toJson', () {
      expect(obj.toJson(), json);
    });
  });
}
