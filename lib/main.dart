import 'package:cima_api/cima_api.dart';
import 'package:cima_client/src/core/env/envirorment_config.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  final cimaApi = CimaApiClient(baseUrl: EnvironmentConfig.apiUrl);
  final cimaRepository = CimaRepository(remoteDataSource: cimaApi);

  runApp(MyApp(
    settingsController: settingsController,
    cimaRepository: cimaRepository,
  ));
}
