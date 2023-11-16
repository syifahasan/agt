// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) {
  return ProfileResponse(
    message: json['message'] as String?,
    result: json['result'] == null
        ? null
        : ProfileResponseResult.fromJson(
            json['result'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
    };

ProfileResponseResult _$ProfileResponseResultFromJson(
    Map<String, dynamic> json) {
  return ProfileResponseResult(
    id: json['id'] as int?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    username: json['username'] as String?,
    phone: json['phone'] as String?,
    dateOfBirth: json['dateOfBirth'] as String?,
  );
}

Map<String, dynamic> _$ProfileResponseResultToJson(
        ProfileResponseResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'username': instance.username,
      'phone': instance.phone,
      'dateOfBirth': instance.dateOfBirth,
    };
