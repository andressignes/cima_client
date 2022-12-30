import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cima_api/cima_api.dart';
import 'package:cima_client/src/core/env/environment_config.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/widgets.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(
  FutureOr<Widget> Function(CimaRepository repository) builder,
) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = AppBlocObserver();
  final cimaApiClient = CimaApiClient(baseUrl: EnvironmentConfig.apiUrl);
  final cimaRepository = CimaRepository(remoteDataSource: cimaApiClient);

  await runZonedGuarded(
    () async => runApp(await builder(cimaRepository)),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
