import 'package:dio/dio.dart';
import 'package:seletivo_jera/Api/api_moviedb.dart';
import 'package:seletivo_jera/services/dio_singleton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PerfilRep {
  deletar() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  Future<String> obterIdSecao(String token) async {
    Response response = await DioSingleton().dio.post(
        'authentication/session/new',
        queryParameters: {'api_key': API.apiKey},
        data: {'request_token': token});
    return response.statusCode == 200 ? response.data['session_id'] : null;
  }
}
