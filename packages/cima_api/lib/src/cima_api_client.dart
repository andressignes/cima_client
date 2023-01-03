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

  Future<Response> _getMedicamento({String? cn, String? nregistro}) async {
    final params = <String, String>{};
    if (cn != null) params['cn'] = cn;
    if (nregistro != null) params['nregistro'] = nregistro;

    return await _get(path: 'medicamento', params: params);
  }

  Future<Response> getPresentation({required String nationalCode}) async {
    return await _get(path: 'presentacion/$nationalCode');
  }

  Future<Response> searchPresentations(
      {Map<String, String>? conditions}) async {
    return await _get(path: 'presentaciones', params: conditions);
  }

  Future<Response> getMedications({Map<String, String>? params}) async {
    return await _get(path: 'medicamentos', params: params);
  }

  Future<Response> getProblemasSuministro({Map<String, String>? params}) async {
    return await _get(path: 'psuministro', params: params);
  }

  Future<Response> _get({
    required String path,
    Map<String, String>? params,
  }) async {
    final url = Uri.https(_baseUrl, '$_baseEndPoint/$path', params);
    final cimaResponse = await _client.get(url);
    return cimaResponse;
  }
}
