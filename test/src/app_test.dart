import 'dart:developer';

import 'package:cima_repository/cima_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCimaRepository extends Mock implements CimaRepository {}

void main() {
  group('App', () {
    testWidgets('Render Home Page', (tester) async {
      log('test');
      // await tester.pumpApp(tester, cimaRepository: MockCimaRepository());
      // expect(find.byType(HomePage), findsOneWidget);
      //  await tester.pumpWidget(buildTestableWidget(App()));
      //  final titleFinder = find.text('Flutter Demo Home Page');
      //  expect(titleFinder, findsOneWidget);
    });
  });
}
