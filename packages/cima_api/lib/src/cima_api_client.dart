import 'dart:developer';

import 'package:http/http.dart';

class CimaApiClient {
  CimaApiClient({
    Client? httpClient,
    required String baseUrl,
  })  : assert(baseUrl.isNotEmpty),
        _baseUrl = baseUrl,
        _client = httpClient ?? Client();

  final String _baseUrl;
  static const _baseEndPoint = '/cima/rest';
  final Client _client;

  Future<Response> getMedicationByCN(String cn) async {
    return _getMedicamento(cn: cn);
  }

  Future<Response> getMedicationByNRegistro(String nRegistro) async {
    return _getMedicamento(nregistro: nRegistro);
  }

  Future<Response> _getMedicamento({
    String? cn,
    String? nregistro,
  }) async {
    final params = <String, String>{};
    if (cn != null) {
      params['cn'] = cn;
    }
    if (nregistro != null) {
      params['nregistro'] = nregistro;
    }
    final url = Uri.https(_baseUrl, '$_baseEndPoint/medicamento', params);
    final cimaResponse = await _client.get(url);
    return cimaResponse;
  }

  Future<Response> getMedications({Map<String, String>? params}) async {
    var url = Uri.https(_baseUrl, '$_baseEndPoint/medicamentos', params);
    log(url.toString());
    var cimaResponse = await _client.get(url);
    return cimaResponse;
  }

  Future<Response> getProblemasSuministro({Map<String, String>? params}) async {
    var url = Uri.https(_baseUrl, '$_baseEndPoint/psuministro', params);
    log(url.toString());
    var cimaResponse = await _client.get(url);
    return cimaResponse;
  }
}
