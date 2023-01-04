import 'package:cima_model/cima_model.dart' show Item;
import 'package:test/test.dart';

void main() {
  group('Item', () {
    late Map<String, dynamic> json;
    late Item obj;
    final int id = 1;
    final code = 'code';
    final name = 'name';

    setUp(() async {
      json = {"id": 1, "codigo": "abc123", "nombre": "VÍA ORAL"};

      obj = Item.fromJson(json);
    });

    test('can be instantiated', () {
      expect(Item(id: id, code: code, name: name), isNotNull);
    });

    test('supports value comparisons', () {
      expect(
          Item(
                id: id,
                code: code,
                name: name,
              ) ==
              Item(
                id: id,
                code: code,
                name: name,
              ),
          isTrue);

      expect(
          Item(
                id: id,
                code: code,
                name: name,
              ) ==
              Item(
                id: id + 1,
                code: code,
                name: name,
              ),
          isFalse);
    });

    test('json serialization fromJson', () {
      expect(Item.fromJson(json), obj);
    });

    test('json serialization toJson', () {
      expect(obj.toJson(), json);
    });
  });
}
