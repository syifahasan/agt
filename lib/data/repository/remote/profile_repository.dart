
import 'dart:convert';
import 'dart:io';
import 'package:authentic_guards/domain/model/params/kta_params.dart';
import 'package:authentic_guards/domain/model/params/register_params.dart';
import 'package:authentic_guards/domain/utils/ExceptionsCustom.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:authentic_guards/domain/model/body/base_response.dart';
import 'package:authentic_guards/domain/model/body/kta_response.dart';
import 'package:authentic_guards/domain/model/body/profile_response.dart';
import 'package:authentic_guards/domain/model/params/kta_params.dart';
import 'package:authentic_guards/helper/ui_helpers.dart';
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';

abstract class ProfileRepository {
  getMe();
  getKta();
  registerKta(KtaParams params, File profile , File ktp);
  update(RegisterParams params);
  myProducts();
}

class ProfileRepositoryImpl extends ProfileRepository {

  final Dio dio;

  final String prefix = "/v1";

  ProfileRepositoryImpl(this.dio);

  @override
  getMe() async {
    try {
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken(true);
      String? messaging = await FirebaseMessaging.instance.getToken();
      print("TOKEN : ${token}");
      print("MESSAGING ${messaging}");

      var header = {
        "Authorization": "Bearer ${token}",
        "messaging": messaging
      };

      final response = await dio.get("${prefix}/user",
          options: Options(followRedirects: false, headers: header));

      if (response.data != null) {
        if (response.statusCode == 200) {
          return ProfileResponse.fromJson(response.data);
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
  getKta() async {
    try {
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken(true);
      print(token);

      var header = {
        "Authorization": "Bearer ${token}",
        "x-api-key": "011",
      };

      final response = await dio.get("${prefix}/kta",
          options: Options(followRedirects: false, headers: header));

      if (response.data != null) {
        if (response.statusCode == 200) {
          return KtaResponse.fromJson(response.data);
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
  registerKta(KtaParams params, File profile, File ktp) async {
    try {

      String? token = await FirebaseAuth.instance.currentUser?.getIdToken(true);

      var header = {
        "Authorization": "Bearer ${token}",
        "x-api-key": "011",
      };

      Map<String, dynamic> jsonData = {};

      jsonData.addAll(params.toJson());


      String fileName = profile!.path.split('/').last;
      String? mimeType = mime(fileName);
      String? mimee = mimeType?.split('/')[0];
      String? type = mimeType?.split('/')[1];
      jsonData.addAll({
        "photo": MultipartFile.fromFileSync(profile.path,filename: fileName, contentType: MediaType(mimee!, type!))
      });


      fileName = ktp.path.split("/").last;
      mimeType = mime(fileName);
      mimee = mimeType?.split('/')[0];
      type = mimeType?.split('/')[1];
      jsonData.addAll({
        "photo_ktp": MultipartFile.fromFileSync(profile.path,filename: fileName, contentType: MediaType(mimee!, type!))
      });

      FormData formData = FormData.fromMap(
          jsonData
      );

      final response = await dio.post("${prefix}/kta",
          data: formData,
          options: Options(followRedirects: false, headers: header,method: "POST"));

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
  update(RegisterParams params) async {
    try {

      String? token = await FirebaseAuth.instance.currentUser?.getIdToken(true);

      print("TOKEN ${token}");

      var header = {
        "Authorization": "Bearer ${token}",
      };

      final response = await dio.put("${prefix}/user",
          data: params.toJson(),
          options: Options(followRedirects: false, headers: header,method: "POST"));

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
  myProducts() async {
    try {
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken(true);
      String? messaging = await FirebaseMessaging.instance.getToken();

      var header = {
        "Authorization": "Bearer ${token}",
        "messaging": messaging
      };

      final response = await dio.get("${prefix}/product/my/1",
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