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

  Future<Either<Failure, Medicamento>> get({
    String? nregistro,
    String? cn,
  }) async {
    try {
      final response =
          await _remoteDataSource.getMedicamento(cn: cn, nregistro: nregistro);
      if (response.statusCode == 200) {
        final medicamento = Medicamento.fromJson(jsonDecode(response.body));
        return Right(medicamento);
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, List<Medicamento>>> authorizedList(
      {Map<String, String>? params}) async {
    try {
      var params = {'autorizados': '1'};
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
          final medicamentos = CimaPaginado.fromJson(jsonDecode(response.body))
              .resultados!
              .map((e) => Medicamento.fromJson(e))
              .toList();
          return Right(medicamentos);
        } catch (e) {
          log('error: $e');
          return Left(FormatFailure());
        }
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, List<Medicamento>>> findMedications(
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
              .map((e) => Medicamento.fromJson(e))
              .toList();
          return Right(medicamentos);
        } catch (e) {
          log('error: $e');
          return Left(FormatFailure());
        }
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
