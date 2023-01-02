import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_app_state.dart';

class ThemeAppCubit extends Cubit<ThemeAppState> {
  ThemeAppCubit({required this.preferences})
      : super(
          ThemeAppState(
            themeMode: ThemeMode.values.firstWhereOrNull(
                  (t) => t.name == preferences.getString('theme'),
                ) ??
                ThemeMode.system,
          ),
        );

  SharedPreferences preferences;

  void setTheme(ThemeMode themeMode) {
    preferences.setString('theme', themeMode.name);
    emit(ThemeAppState(themeMode: themeMode));
  }
}
