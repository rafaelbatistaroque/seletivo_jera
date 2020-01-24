import 'package:dio/dio.dart';
import 'package:seletivo_jera/Api/api_moviedb.dart';

class DioSingleton {
  Dio _dio;
  static DioSingleton _instanciaDio;
  DioSingleton._() {
    _initDio();
  }

  factory DioSingleton() {
    return _instanciaDio ??= DioSingleton._();
  }
  _initDio() {
    _dio = Dio();
    _dio.options.baseUrl = API.urlBaseMovieDb;
  }

  Dio get dio => _dio;
}
