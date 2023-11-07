// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kta_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KtaResponse _$KtaResponseFromJson(Map<String, dynamic> json) {
  return KtaResponse(
    message: json['message'] as String?,
    result: json['result'] == null
        ? null
        : Result.fromJson(json['result'] as Map<String, dynamic>),
    status: json['status'] as int?,
  );
}

Map<String, dynamic> _$KtaResponseToJson(KtaResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'status': instance.status,
    };

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
    kta: json['kta'] == null
        ? null
        : Kta.fromJson(json['kta'] as Map<String, dynamic>),
    status: json['status'] == null
        ? null
        : Status.fromJson(json['status'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'kta': instance.kta,
      'status': instance.status,
    };

Kta _$KtaFromJson(Map<String, dynamic> json) {
  return Kta(
    id: json['id'] as int?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    name: json['name'] as String?,
    noid: json['noid'] as String?,
    tglLahir: json['tglLahir'] == null
        ? null
        : DateTime.parse(json['tglLahir'] as String),
    address: json['address'] as String?,
    agama: json['agama'] as String?,
    status: json['status'] as String?,
    kotareg: json['kotareg'] as int?,
    pekerjaan: json['pekerjaan'] as int?,
    photo: json['photo'] as String?,
    photoKtp: json['photoKtp'] as String?,
    email: json['email'] as String?,
    phonenumber: json['phonenumber'] as String?,
    nik: json['nik'] as String?,
    statusKta: json['statusKta'] as int?,
    asname: json['asname'] as String?,
    agClientId: json['agClientId'] as int?,
    jk: json['jk'] as String?,
    agInvoiceId: json['agInvoiceId'] as int?,
    subhobby: json['subhobby'] as int?,
    agCodesId: json['agCodesId'] as int?,
    kota: json['kota'] == null
        ? null
        : Kota.fromJson(json['kota'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$KtaToJson(Kta instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'name': instance.name,
      'noid': instance.noid,
      'tglLahir': instance.tglLahir?.toIso8601String(),
      'address': instance.address,
      'agama': instance.agama,
      'status': instance.status,
      'kotareg': instance.kotareg,
      'pekerjaan': instance.pekerjaan,
      'photo': instance.photo,
      'photoKtp': instance.photoKtp,
      'email': instance.email,
      'phonenumber': instance.phonenumber,
      'nik': instance.nik,
      'statusKta': instance.statusKta,
      'asname': instance.asname,
      'agClientId': instance.agClientId,
      'jk': instance.jk,
      'agInvoiceId': instance.agInvoiceId,
      'subhobby': instance.subhobby,
      'agCodesId': instance.agCodesId,
      'kota': instance.kota,
    };

Kota _$KotaFromJson(Map<String, dynamic> json) {
  return Kota(
    id: json['id'] as int?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    name: json['name'] as String?,
    districtsId: json['districtsId'] as int?,
    districts: json['districts'] == null
        ? null
        : Districts.fromJson(json['districts'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$KotaToJson(Kota instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'name': instance.name,
      'districtsId': instance.districtsId,
      'districts': instance.districts,
    };

Districts _$DistrictsFromJson(Map<String, dynamic> json) {
  return Districts(
    id: json['id'] as int?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    name: json['name'] as String?,
    citiesId: json['citiesId'] as int?,
    cities: json['cities'] == null
        ? null
        : Cities.fromJson(json['cities'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DistrictsToJson(Districts instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'name': instance.name,
      'citiesId': instance.citiesId,
      'cities': instance.cities,
    };

Cities _$CitiesFromJson(Map<String, dynamic> json) {
  return Cities(
    id: json['id'] as int?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    name: json['name'] as String?,
    provincesId: json['provincesId'] as int?,
    provinces: json['provinces'] == null
        ? null
        : Provinces.fromJson(json['provinces'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CitiesToJson(Cities instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'name': instance.name,
      'provincesId': instance.provincesId,
      'provinces': instance.provinces,
    };

Provinces _$ProvincesFromJson(Map<String, dynamic> json) {
  return Provinces(
    id: json['id'] as int?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    name: json['name'] as String?,
  );
}

Map<String, dynamic> _$ProvincesToJson(Provinces instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'name': instance.name,
    };

Status _$StatusFromJson(Map<String, dynamic> json) {
  return Status(
    status_kta: json['status_kta'] as String?,
  );
}

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'status_kta': instance.status_kta,
    };
