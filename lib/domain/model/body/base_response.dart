import 'package:json_annotation/json_annotation.dart';

class BaseResponse<T> {
  final String message;
  final T? result;

  BaseResponse({required this.message, this.result});

  factory BaseResponse.fromJson(Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    return BaseResponse<T>(
      message: json["message"],
      result: create(json["data"]),
    );
  }
}