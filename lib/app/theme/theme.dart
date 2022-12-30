import 'package:flutter/material.dart';

final appTheme = AppTheme();

class AppTheme {
  final _theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal),
  );

  ThemeData get light => _theme.copyWith(
        brightness: Brightness.light,
      );

  ThemeData get dark => _theme.copyWith(
        brightness: Brightness.dark,
      );
}
