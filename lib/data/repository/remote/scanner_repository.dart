import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:authentic_guards/domain/model/params/check_code_params.dart';
import 'package:authentic_guards/domain/model/params/claim_params.dart';
import 'package:authentic_guards/domain/utils/ExceptionsCustom.dart';

abstract class ScannerRepository {
  checkCode(CheckCodeParams params);
  claim(ClaimParams params);
}

class ScannerRepositoryImpl extends ScannerRepository {
  final Dio dio;
  ScannerRepositoryImpl(this.dio);

  final String prefix = "/v2";

  @override
  checkCode(CheckCodeParams params) async {
    try {
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken(true);

      var header = {
        "Authorization": "Bearer ${token}",
      };

      final response = await dio.post("${prefix}/check",
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

  @override
  claim(ClaimParams params) async {
    try {
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken(true);

      print("Bearer ${token}");

      var header = {
        "Authorization": "Bearer ${token}",
      };

      Map<String, dynamic> jsonObject = params.toJson();
      jsonObject["code_claim"] = params.code_claim?.toJson();

      final response = await dio.post("${prefix}/claim",
          data: jsonObject,
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
