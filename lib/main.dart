import 'package:cima_api/cima_api.dart';
import 'package:cima_client/app/app.dart';
import 'package:cima_client/common/env/environment_config.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';

void main() async {
  final cimaApi = CimaApiClient(baseUrl: EnvironmentConfig.apiUrl);
  final cimaRepository = CimaRepository(remoteDataSource: cimaApi);
  runApp(App(cimaRepository: cimaRepository));
}
