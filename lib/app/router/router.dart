import 'package:cima_client/app/router/routes.dart';
import 'package:cima_client/authorized/authorized.dart';
import 'package:cima_client/home/home.dart';
import 'package:cima_client/medication_detail/medication_detail.dart';
import 'package:cima_client/search/search.dart';
import 'package:cima_client/search_result/search_result.dart';
import 'package:cima_client/settings/settings.dart';
import 'package:cima_client/supply_problems/supply_problems.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: Routes.home.path,
  routes: <RouteBase>[
    GoRoute(
      name: Routes.home.name,
      path: Routes.home.path,
      pageBuilder: (context, state) => HomePage.page,
    ),
    GoRoute(
      name: Routes.settings.name,
      path: Routes.settings.path,
      pageBuilder: (context, state) => SettingsPage.page,
    ),
    GoRoute(
      name: Routes.supplyProblems.name,
      path: Routes.supplyProblems.path,
      pageBuilder: (context, state) => SupplyProblemsPage.page,
    ),
    GoRoute(
      name: Routes.lastAuthorized.name,
      path: Routes.lastAuthorized.path,
      pageBuilder: (context, state) => LastAuthorizedPage.page,
    ),
    GoRoute(
      name: Routes.search.name,
      path: Routes.search.path,
      pageBuilder: (context, state) => SearchPage.page,
      routes: [
        GoRoute(
          name: Routes.searchResult.name,
          path: Routes.searchResult.path,
          pageBuilder: (context, state) =>
              SearchResultPage.page(params: state.queryParams),
        ),
      ],
    ),
    GoRoute(
      name: Routes.medicationDetail.name,
      path: Routes.medicationDetail.path,
      pageBuilder: (context, state) => MedicationDetailPage.page,
    )
  ],
);
// onGenerateRoute: (RouteSettings routeSettings) {
// return MaterialPageRoute<void>(
// settings: routeSettings,
// builder: (BuildContext context) {
// switch (routeSettings.name) {
// case SettingsPage.routeName:
// return const SettingsPage();
// case SearchPage.routeName:
// return const SearchPage();
// case SearchResultPage.routeName:
// return SearchResultPage(
// params: ModalRoute.of(context)!.settings.arguments
// as Map<String, String>);
// case SupplyProblemsPage.routeName:
// return const SupplyProblemsPage();
// case LastAuthorizedPage.routeName:
// return const LastAuthorizedPage();
// case HomePage.routeName:
// default:
// return const HomePage();
// }
// },
// );
// },
