import 'package:cima_client/app/app.dart';
import 'package:cima_client/home/home.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockCimaRepository extends Mock implements CimaRepository {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  group('App', () {
    late CimaRepository cimaRepository;
    late SharedPreferences sharedPreferences;
    setUp(() {
      cimaRepository = MockCimaRepository();
      sharedPreferences = MockSharedPreferences();
    });
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(
        App(
          cimaRepository: cimaRepository,
          preferences: sharedPreferences,
        ),
      );
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
