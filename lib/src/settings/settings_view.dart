import 'package:cima_client/src/theme/cubit/theme_app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustes'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              BlocBuilder<ThemeAppCubit, ThemeAppState>(
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
              ),
              const Spacer(),
              Center(
                  child: Column(
                children: [
                  Image.asset('assets/images/cima.png'),
                  const Text(
                      'Informacion proporcionada por Agencia Española de Medicamentos y Productos Sanitarios',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10,
                      )),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
