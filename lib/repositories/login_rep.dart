import 'package:seletivo_jera/Api/api_moviedb.dart';
import 'package:seletivo_jera/models/login_m.dart';
import '../services/dio_singleton.dart';
import 'package:dio/dio.dart';

class LoginRep {
  Future<String> obterToken() async {
    Response response = await DioSingleton().dio.get('authentication/token/new',
        queryParameters: {'api_key': API.apiKey});
    return response.data['request_token'];
  }

  Future<Response> autenticarUsuario(Login usuarioLogin) async {
    Response response = await DioSingleton().dio.post(
      'authentication/token/validate_with_login',
      queryParameters: {
        'api_key': API.apiKey,
      },
      data: {
        "username": usuarioLogin.usuario,
        "password": usuarioLogin.senha,
        "request_token": usuarioLogin.token
      },
    );
    return response;
  }
}
