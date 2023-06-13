import 'package:cima_client/app/router/router.dart';
import 'package:cima_client/l10n/l10n.dart';
import 'package:cima_client/search_result/bloc/search_medication_result_bloc.dart';
import 'package:cima_client/theme/theme.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatelessWidget {
  const App({
    required this.cimaRepository,
    required this.preferences,
    super.key,
  });

  final CimaRepository cimaRepository;
  final SharedPreferences preferences;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: cimaRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ThemeAppCubit>(
            create: (context) => ThemeAppCubit(preferences: preferences),
          ),
          BlocProvider(
            create: (context) =>
                SearchMedicationResultBloc(cimaRepository: cimaRepository),
          ),
        ],
        child: BlocBuilder<ThemeAppCubit, ThemeAppState>(
          builder: (context, state) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: router,
              theme: appTheme.light,
              darkTheme: appTheme.dark,
              themeMode: state.themeMode,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
            );
          },
        ),
      ),
    );
  }
}
