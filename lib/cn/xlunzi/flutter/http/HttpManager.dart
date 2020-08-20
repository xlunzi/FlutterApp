import 'package:dio/dio.dart';

class HttpManager {
  static HttpManager _httpManager;
  Dio _dio;

  static const String _baseUrl = "https://www.wanandroid.com/";

  HttpManager._() {
    _dio = Dio(BaseOptions(baseUrl: _baseUrl, connectTimeout: 5 * 1000, receiveTimeout: 3 * 1000));
  }

  factory HttpManager() {
    if (_httpManager == null) {
      _httpManager = HttpManager._();
    }
    return _httpManager;
  }

  request(String url, {String method = "GET"}) async {
    try {
      Response response = await _dio.request(url, options: Options(method: method));
      if (200 == response.statusCode) {
        return response.data;
      }
    } catch (e, s) {
      print(s);
    }
    return null;
  }
}
