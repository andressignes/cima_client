import 'package:cima_api/cima_api.dart';
import 'package:cima_client/src/core/env/envirorment_config.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';

import 'src/app.dart';

void main() async {
  final cimaApi = CimaApiClient(baseUrl: EnvironmentConfig.apiUrl);
  final cimaRepository = CimaRepository(remoteDataSource: cimaApi);

  runApp(MyApp(
    cimaRepository: cimaRepository,
  ));
}
