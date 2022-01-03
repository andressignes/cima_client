import 'package:cima_client/src/theme/cubit/theme_app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeSelectorWidget extends StatelessWidget {
  const ThemeSelectorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeAppCubit, ThemeAppState>(
      builder: (context, state) {
        return DropdownButton<ThemeMode>(
          value: state.themeMode,
          onChanged: (themeMode) =>
              context.read<ThemeAppCubit>().setTheme(themeMode!),
          items: const [
            DropdownMenuItem(
              value: ThemeMode.system,
              child: Text('Tema del sistema'),
            ),
            DropdownMenuItem(
              value: ThemeMode.light,
              child: Text('Tema claro'),
            ),
            DropdownMenuItem(
              value: ThemeMode.dark,
              child: Text('Tema oscuro'),
            )
          ],
        );
      },
    );
  }
}
