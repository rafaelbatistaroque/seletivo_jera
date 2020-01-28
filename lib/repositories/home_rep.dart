import 'package:dio/dio.dart';
import 'package:seletivo_jera/Api/api_moviedb.dart';
import 'package:seletivo_jera/models/filme_m.dart';
import 'package:seletivo_jera/services/dio_singleton.dart';

class HomeRep {
  Future<List<Filme>> obterListaFilmesPopulares() async {
    Response response = await DioSingleton()
        .dio
        .get('/movie/popular', queryParameters: {'api_key': API.apiKey});
    return (response.data['results'] as List<dynamic>)
        .map((listaFilme) => Filme.fromJson(listaFilme))
        .toList();
  }

  Future<List<Filme>> pesquisarListaFilmes(String query) async {
    Response response = await DioSingleton().dio.get('/search/movie',
        queryParameters: {'api_key': API.apiKey, 'query': query});
    return (response.data['results'] as List<dynamic>)
        .map((listaFilme) => Filme.fromJson(listaFilme))
        .toList();
  }

  Future<Response> marcarFilmeComoFavorito(String idSecao, Filme filme) async {
    Response response = await DioSingleton().dio.post(
      '/account/$idSecao/favorite',
      queryParameters: {'api_key': API.apiKey},
      data: {
        "media_type": "movie",
        "media_id": filme.idMovieOrTv,
        "favorite": true
      },
    );
    return response;
  }
}
