import 'package:http/http.dart';

class CimaApiClient {
  CimaApiClient({
    Client? httpClient,
    required baseUrl,
  })  : _baseUrl = baseUrl,
        _client = httpClient ?? Client();

  final String _baseUrl;
  static const _baseEndPoint = '/cima/rest';
  final Client _client;

  Future<Response> getMedicamento({
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
    // if (cimaResponse.statusCode != 200) {
    //   //TODO CAPTURAR EXCEPCION
    //   // throw ServerException();
    // }
    //
    // final decode = json.decode(cimaResponse.body);
    // return MedicamentoModel.fromJson(decode);
  }

  Future<Response> getAutorizados({Map<String, String>? userParams}) async {
    var params = {'autorizados': '1'};
    userParams?.isNotEmpty == true;
    var url = Uri.https(_baseUrl, '$_baseEndPoint/medicamentos', params);
    var cimaResponse = await _client.get(url);
    return cimaResponse;
    // if (cimaResponse.statusCode != 200) {
    //   //TODO CAPTURE EXCEPTION
    //   // throw CimaRequestFailure();
    // }
    //
    // var decode = json.decode(cimaResponse.body);
    // return CimaPaginadoModel.fromJson(decode);
  }
}
