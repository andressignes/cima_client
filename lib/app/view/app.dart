import 'package:cima_client/app/router/router.dart';
import 'package:cima_client/l10n/l10n.dart';
import 'package:cima_client/theme/theme.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required CimaRepository cimaRepository,
  }) : _cimaRepository = cimaRepository;

  final CimaRepository _cimaRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _cimaRepository,
      child: BlocProvider<ThemeAppCubit>(
        create: (context) => ThemeAppCubit(),
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
