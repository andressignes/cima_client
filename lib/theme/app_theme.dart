import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

final appTheme = AppTheme();

class AppTheme {
  final _colorScheme = FlexScheme.dellGenoa;
  final _userMaterial3 = true;

  ThemeData get light => FlexThemeData.light(
        useMaterial3: _userMaterial3,
        scheme: _colorScheme,
      );

  ThemeData get dark => FlexThemeData.dark(
        useMaterial3: _userMaterial3,
        scheme: _colorScheme,
      );
}
