import 'package:json_annotation/json_annotation.dart';
part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  final String? message;
  final ProfileResponseResult? result;
  ProfileResponse({this.message,this.result});

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

}

@JsonSerializable()
class ProfileResponseResult {
  final int? id;
  final String? name;
  final String? email;
  final String? username;
  final String? phone;
  final String? dateOfBirth;

  ProfileResponseResult({this.id, this.name, this.email, this.username, this.phone, this.dateOfBirth});

  Map<String, dynamic> toJson() => _$ProfileResponseResultToJson(this);

  factory ProfileResponseResult.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseResultFromJson(json);

}