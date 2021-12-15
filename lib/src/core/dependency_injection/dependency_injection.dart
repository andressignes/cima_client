// import 'package:boticario/src/core/env/envirorment_config.dart';
// import 'package:boticario/src/features/authorized/bloc/authorized_bloc.dart';
// import 'package:boticario/src/features/medicamento/bloc/medicamento_bloc.dart';
// import 'package:cima/cima.dart';
// import 'package:get_it/get_it.dart';
// import 'package:http/http.dart';
//
// final getIt = GetIt.instance;
//
// void setUpDI() {
//   /// * Repository
//   getIt.registerLazySingleton<IMedicationRepository>(
//     () => CimaRepository(
//       remoteDataSouce: CimaDataSource(
//           httpClient: Client(), baseUrl: EnvironmentConfig.apiUrl),
//     ),
//   );
//
//   // * Use Case
//   getIt.registerLazySingleton<GetMedicamento>(() {
//     final repository = getIt<IMedicationRepository>();
//     return GetMedicamento(repository: repository);
//   });
//
//   getIt.registerLazySingleton<GetAutorizados>(() {
//     final repository = getIt<IMedicationRepository>();
//     return GetAutorizados(repository: repository);
//   });
//
//   // * Bloc
//   getIt.registerLazySingleton<AuthorizedBloc>(
//       () => AuthorizedBloc(getAutorizados: getIt<GetAutorizados>()));
//   getIt.registerLazySingleton<MedicamentoBloc>(
//       () => MedicamentoBloc(getMedicamento: getIt<GetMedicamento>()));
// }
