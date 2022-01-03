import 'package:cima_client/src/authorized/authorized.dart'
    show LastAuthorizedPage;
import 'package:cima_client/src/home/home.dart';
import 'package:cima_client/src/search/search.dart' show SearchPage;
import 'package:cima_client/src/search_result/search_result.dart'
    show SearchResultPage;
import 'package:cima_client/src/settings/settings.dart' show SettingsPage;
import 'package:cima_client/src/supply_problems/supply_problems.dart'
    show SupplyProblemsPage;
import 'package:cima_client/src/theme/theme.dart'
    show ThemeAppCubit, ThemeAppState;
import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required CimaRepository cimaRepository,
  })  : _cimaRepository = cimaRepository,
        super(key: key);

  final CimaRepository _cimaRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _cimaRepository,
      child: BlocProvider<ThemeAppCubit>(
        create: (_) => ThemeAppCubit(),
        child: BlocBuilder<ThemeAppCubit, ThemeAppState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              restorationScopeId: 'app',
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', ''), // English, no country code
              ],
              onGenerateTitle: (BuildContext context) =>
                  AppLocalizations.of(context)!.appTitle,
              theme: ThemeData(
                  colorScheme:
                      ColorScheme.fromSwatch(primarySwatch: Colors.teal)),
              darkTheme: ThemeData.dark().copyWith(
                  colorScheme:
                      ColorScheme.fromSwatch(primarySwatch: Colors.teal)),
              themeMode: state.themeMode,
              onGenerateRoute: (RouteSettings routeSettings) {
                return MaterialPageRoute<void>(
                  settings: routeSettings,
                  builder: (BuildContext context) {
                    switch (routeSettings.name) {
                      case SettingsPage.routeName:
                        return const SettingsPage();
                      case SearchPage.routeName:
                        return const SearchPage();
                      case SearchResultPage.routeName:
                        return SearchResultPage(
                            params: ModalRoute.of(context)!.settings.arguments
                                as Map<String, String>);
                      case SupplyProblemsPage.routeName:
                        return const SupplyProblemsPage();
                      case LastAuthorizedPage.routeName:
                        return const LastAuthorizedPage();
                      case HomePage.routeName:
                      default:
                        return const HomePage();
                    }
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
