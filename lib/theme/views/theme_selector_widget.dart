import 'package:cima_client/l10n/l10n.dart';
import 'package:cima_client/theme/cubit/theme_app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeSelectorWidget extends StatelessWidget {
  const ThemeSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<ThemeAppCubit, ThemeAppState>(
      builder: (context, state) {
        return DropdownButton<ThemeMode>(
          value: state.themeMode,
          onChanged: (themeMode) =>
              context.read<ThemeAppCubit>().setTheme(themeMode!),
          items: [
            DropdownMenuItem(
              value: ThemeMode.system,
              child: Text(l10n.system_theme),
            ),
            DropdownMenuItem(
              value: ThemeMode.light,
              child: Text(l10n.light_mode),
            ),
            DropdownMenuItem(
              value: ThemeMode.dark,
              child: Text(l10n.dark_mode),
            )
          ],
        );
      },
    );
  }
}
