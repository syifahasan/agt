// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kta_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KtaParams _$KtaParamsFromJson(Map<String, dynamic> json) {
  return KtaParams(
    name: json['name'] as String?,
    tgl_lahir: json['tgl_lahir'] as String?,
    address: json['address'] as String?,
    agama: json['agama'] as String?,
    status: json['status'] as int?,
    kotareg: json['kotareg'] as int?,
    pekerjaan: json['pekerjaan'] as int?,
    email: json['email'] as String?,
    phonenumber: json['phonenumber'] as String?,
    nik: json['nik'] as String?,
    status_kta: json['status_kta'] as int?,
    asname: json['asname'] as String?,
    jk: json['jk'] as int?,
    subhobby: json['subhobby'] as int?,
  );
}

Map<String, dynamic> _$KtaParamsToJson(KtaParams instance) => <String, dynamic>{
      'name': instance.name,
      'tgl_lahir': instance.tgl_lahir,
      'address': instance.address,
      'agama': instance.agama,
      'status': instance.status,
      'kotareg': instance.kotareg,
      'pekerjaan': instance.pekerjaan,
      'email': instance.email,
      'phonenumber': instance.phonenumber,
      'nik': instance.nik,
      'status_kta': instance.status_kta,
      'asname': instance.asname,
      'jk': instance.jk,
      'subhobby': instance.subhobby,
    };
