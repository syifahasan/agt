// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'claim_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClaimParams _$ClaimParamsFromJson(Map<String, dynamic> json) {
  return ClaimParams(
    code_claim: json['code_claim'] == null
        ? null
        : CodeClaim.fromJson(json['code_claim'] as Map<String, dynamic>),
    latitude: json['latitude'] as String?,
    longitude: json['longitude'] as String?,
    pin: json['pin'] as String?,
  );
}

Map<String, dynamic> _$ClaimParamsToJson(ClaimParams instance) =>
    <String, dynamic>{
      'code_claim': instance.code_claim,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'pin': instance.pin,
    };

CodeClaim _$CodeClaimFromJson(Map<String, dynamic> json) {
  return CodeClaim(
    value: json['value'] as String?,
    key: json['key'] as String?,
  );
}

Map<String, dynamic> _$CodeClaimToJson(CodeClaim instance) => <String, dynamic>{
      'value': instance.value,
      'key': instance.key,
    };
