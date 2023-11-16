// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_code_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckCodeParams _$CheckCodeParamsFromJson(Map<String, dynamic> json) {
  return CheckCodeParams(
    code: json['code'] as String?,
    latitude: json['latitude'] as String?,
    longitude: json['longitude'] as String?,
  );
}

Map<String, dynamic> _$CheckCodeParamsToJson(CheckCodeParams instance) =>
    <String, dynamic>{
      'code': instance.code,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
