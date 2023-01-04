import 'dart:convert';
import 'dart:developer';

import 'package:cima_api/cima_api.dart';
import 'package:cima_model/cima_model.dart';
import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';

class CimaRepository {
  CimaRepository({
    required CimaApiClient remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final CimaApiClient _remoteDataSource;

  Future<Either<Failure, Medication>> getMedicamento({
    String? nregistro,
    String? cn,
  }) async {
    try {
      final response = nregistro != null
          ? await _remoteDataSource.getMedicationByNRegistro(nregistro)
          : cn != null
              ? await _remoteDataSource.getMedicationByCN(cn)
              : null;
      if (response == null) {
        return Left(ServerFailure());
      }
      if (response.statusCode != 200) {
        return Left(ServerFailure());
      }
      try {
        final medicamento = Medication.fromJson(jsonDecode(response.body));
        return Right(medicamento);
      } on FormatException {
        return Left(FormatFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, Presentation>> getPresentation({
    required String nationalCode,
  }) async {
    try {
      final response =
          await _remoteDataSource.getPresentation(nationalCode: nationalCode);

      if (response.statusCode != 200) {
        return Left(ServerFailure());
      }
      try {
        final presentation = Presentation.fromJson(jsonDecode(response.body));
        return Right(presentation);
      } on FormatException {
        return Left(FormatFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, List<Medication>>> findMedications(
      {Map<String, String>? params}) async {
    try {
      final response = await _remoteDataSource.getMedications(
        params: params,
      );
      log('statusCode: ${response.statusCode}');
      if (response.statusCode == 200) {
        try {
          final cimaPaginado = CimaPaginado.fromJson(jsonDecode(response.body));
          if (cimaPaginado.resultados?.isEmpty ?? true) {
            return Right([]);
          }
          final medicamentos = cimaPaginado.resultados!
              .map((e) => Medication.fromJson(e))
              .toList();
          return Right(medicamentos);
        } catch (e) {
          log('error: $e');
          return Left(FormatFailure());
        }
      } else if (response.statusCode == 204) {
        return Left(NoDataFailure());
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, List<Presentation>>> findPresentations(
      {Map<String, String>? params}) async {
    try {
      final response = await _remoteDataSource.searchPresentations(
        conditions: params,
      );
      log('statusCode: ${response.statusCode}');
      if (response.statusCode == 200) {
        try {
          final cimaPaginado = CimaPaginado.fromJson(jsonDecode(response.body));
          if (cimaPaginado.resultados?.isEmpty ?? true) {
            return Right([]);
          }
          final presentations = cimaPaginado.resultados!
              .map((e) => Presentation.fromJson(e))
              .toList();
          return Right(presentations);
        } catch (e) {
          log('error: $e');
          return Left(FormatFailure());
        }
      } else if (response.statusCode == 204) {
        return Left(NoDataFailure());
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, List<SupplyProblems>>> findProblemasSuministro({
    required Map<String, String> params,
  }) async {
    try {
      final response = await _remoteDataSource.getProblemasSuministro(
        params: params,
      );
      log('statusCode: ${response.statusCode}');
      if (response.statusCode != 200) {
        return Left(ServerFailure());
      }

      try {
        final cimaPaginado = CimaPaginado.fromJson(jsonDecode(response.body));
        if (cimaPaginado.resultados?.isEmpty ?? true) {
          return Right([]);
        }
        final problemasSuministro = cimaPaginado.resultados!
            .map((e) => SupplyProblems.fromJson(e))
            .toList();
        return Right(problemasSuministro);
      } catch (e) {
        log('error: $e');
        return Left(FormatFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
