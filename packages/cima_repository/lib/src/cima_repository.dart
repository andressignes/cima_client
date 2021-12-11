import 'dart:convert';

import 'package:cima_api/cima_api.dart';
import 'package:cima_model/cima_model.dart';
import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';

class CimaRepository {
  CimaRepository({
    required CimaApiClient remoteDataSouce,
  }) : _remoteDataSouce = remoteDataSouce;

  final CimaApiClient _remoteDataSouce;

  Future<Either<Failure, Medicamento>> get(
      {String? nregistro, String? cn}) async {
    try {
      final response =
          await _remoteDataSouce.getMedicamento(cn: cn, nregistro: nregistro);
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
      final response =
          await _remoteDataSouce.getAutorizados(userParams: params);
      if (response.statusCode == 200) {
        final medicamentos = (jsonDecode(response.body) as List<dynamic>)
            .cast<Map<String, dynamic>>()
            .map((json) => Medicamento.fromJson(json))
            .toList();
        return Right(medicamentos);
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
