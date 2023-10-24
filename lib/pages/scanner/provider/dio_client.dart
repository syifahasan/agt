import 'package:dio/dio.dart';

class DioClient {
  int errorToken = 0;

  Dio get dio => _getDio();

  Dio _getDio() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://admin.authenticguards.com/',
      headers: {
        'x-api-key': "003"
      },
      connectTimeout: Duration(seconds: 50000),
      receiveTimeout: Duration(seconds: 30000),
    );
    return dio;
  }
}