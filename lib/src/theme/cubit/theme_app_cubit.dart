import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_app_state.dart';

class ThemeAppCubit extends Cubit<ThemeAppState> {
  ThemeAppCubit() : super(const ThemeAppState(themeMode: ThemeMode.system));

  void setTheme(ThemeMode themeMode) =>
      emit(ThemeAppState(themeMode: themeMode));
}
