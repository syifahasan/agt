import 'dart:convert';
import 'package:authentic_guards/domain/model/params/register_params.dart';
import 'package:authentic_guards/domain/utils/ExceptionsCustom.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  registerToServer(RegisterParams params);
}

class AuthRepositoryImpl extends AuthRepository {
  final Dio dio;
  final String prefix = "/v1";

  AuthRepositoryImpl({required this.dio});

  @override
  registerToServer(params) async {
    try {
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken(true);

      var header = {
        "Authorization": "Bearer ${token}",
      };

      Map<String, dynamic> jsonObject = params.toJson();

      params.toJson().forEach((key, value) {
        if (value == null) {
          jsonObject.remove(key);
        }
      });

      final response = await dio.post("${prefix}/user",
          data: params.toJson(),
          options: Options(followRedirects: false, headers: header));

      if (response.data != null) {
        if (response.statusCode == 200) {
          return response.data;
        } else {
          throw ExceptionsCustom("Unidentified");
        }
      } else {
        throw ExceptionsCustom("Unidentified");
      }
    } on DioError catch (e) {
      if (e.response != null) {
        String responseError = "Something went wrong";
        if (e.response?.data != null) {
          if (e.response?.data is String) {
            responseError = e.response?.data ?? "Something went wrong";
          } else {
            responseError =
                json.decode(json.encode(e.response?.data))['message'];
          }
        }

        if (responseError
            .toString()
            .toLowerCase()
            .contains("invalid or expired jwt")) {
          // throw UnAuthorizeException("UnAuthorized Token");
        } else {
          throw ExceptionsCustom(responseError);
        }
      } else {
        throw ExceptionsCustom("Something went wrong");
      }
    }
  }
}
