import 'package:dio/dio.dart';

class HttpManager {
  static var _dio;

  static Dio getDio(String baseUrl) {
    if (_dio == null) {
      _dio = new Dio();
      _dio.options.baseUrl = baseUrl;
      _dio.options.connectTimeout = 6000;
      _dio.options.receiveTimeout = 6000;
      _dio.interceptors.add(LogInterceptor(responseBody: false));
    }
    return _dio;
  }
}
