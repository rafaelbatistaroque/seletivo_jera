import 'package:seletivo_jera/Api/api_moviedb.dart';
import '../services/dio_singleton.dart';
import 'package:dio/dio.dart';

class UsuarioRep {
  Future<Map> obterDetalhesUsuario(String idSecao) async {
    Response response = await DioSingleton().dio.get('account',
        queryParameters: {'api_key': API.apiKey, 'session_id': idSecao});
    return response.data;
  }
}
