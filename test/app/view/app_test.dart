import 'package:cima_client/app/app.dart';
import 'package:cima_client/home/home.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCimaRepository extends Mock implements CimaRepository {}

void main() {
  group('App', () {
    late CimaRepository cimaRepository;
    setUp(() {
      cimaRepository = MockCimaRepository();
    });
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(
        App(
          cimaRepository: cimaRepository,
        ),
      );
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
