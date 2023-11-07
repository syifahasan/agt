// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterParams _$RegisterParamsFromJson(Map<String, dynamic> json) {
  return RegisterParams(
    name: json['name'] as String?,
    phone: json['phone'] as String?,
    dateOfBirth: json['dateOfBirth'] as String?,
    gender: json['gender'] as int?,
    villages: json['villages'] as int?,
    instagram: json['instagram'] as String?,
  );
}

Map<String, dynamic> _$RegisterParamsToJson(RegisterParams instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
      'villages': instance.villages,
      'instagram': instance.instagram,
    };
