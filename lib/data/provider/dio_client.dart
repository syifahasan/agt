import 'package:authentic_guards/data/repository/config/api_constant.dart';
import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer2/dio_flutter_transformer2.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../repository/local/hive_local_database.dart';

class DioClient {
  final String apiBaseUrl;
  int errorToken = 0;

  DioClient(this.apiBaseUrl);

  Dio get dio => _getDio();

  Dio _getDio() {
    BaseOptions options = BaseOptions(
      baseUrl: apiBaseUrl,
      headers: {
        'x-api-key': "003"
      },
      connectTimeout: 50000,
      receiveTimeout: 30000,
    );
    Dio dio = Dio(options);

    dio.transformer = FlutterTransformer();
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    ));
    dio.interceptors.add(InterceptorsWrapper(onError: (error, handler) async {
      if (error.response?.statusCode == 401 && error.response?.data['message'] != "Incorrect nik or password" && error.response?.data['message'] != "Otp verification failed" && error.response?.data['message'] != "Password reset failed" ) {
        await HiveLocalDatabase.deleteAllUserInfo();
        Get.toNamed("/");
      }
      handler.next(error);
    }));

    return dio;
  }
}