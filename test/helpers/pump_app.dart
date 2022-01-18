import 'package:cima_client/src/localization/l10n.dart';
import 'package:cima_client/src/theme/theme.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    required CimaRepository cimaRepository,
  }) async {
    await pumpWidget(
      RepositoryProvider.value(
        value: cimaRepository,
        child: BlocProvider<ThemeAppCubit>(
          create: (context) => ThemeAppCubit(),
          child: BlocBuilder<ThemeAppCubit, ThemeAppState>(
            builder: (context, state) {
              return MaterialApp(
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                ],
                supportedLocales: AppLocalizations.supportedLocales,
                theme: ThemeData(),
                darkTheme: ThemeData.dark(),
                themeMode: state.themeMode,
                home: Material(
                  child: widget,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
