import 'package:json_annotation/json_annotation.dart';
part 'kta_response.g.dart';

@JsonSerializable()
class KtaResponse {
  final String? message;
  final Result? result;
  final int? status;

  KtaResponse({this.message, this.result, this.status});

  Map<String, dynamic> toJson() => _$KtaResponseToJson(this);

  factory KtaResponse.fromJson(Map<String, dynamic> json) =>
      _$KtaResponseFromJson(json);
}

@JsonSerializable()
class Result {
  final Kta? kta;
  final Status? status;

  Result({
    this.kta,
    this.status,
  });

  Map<String, dynamic> toJson() => _$ResultToJson(this);

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@JsonSerializable()
class Kta {
  Kta({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.noid,
    this.tglLahir,
    this.address,
    this.agama,
    this.status,
    this.kotareg,
    this.pekerjaan,
    this.photo,
    this.photoKtp,
    this.email,
    this.phonenumber,
    this.nik,
    this.statusKta,
    this.asname,
    this.agClientId,
    this.jk,
    this.agInvoiceId,
    this.subhobby,
    this.agCodesId,
    this.kota,
  });

  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? name;
  final String? noid;
  final DateTime? tglLahir;
  final String? address;
  final String? agama;
  final String? status;
  final int? kotareg;
  final int? pekerjaan;
  final String? photo;
  final String? photoKtp;
  final String? email;
  final String? phonenumber;
  final String? nik;
  final int? statusKta;
  final String? asname;
  final int? agClientId;
  final String? jk;
  final int? agInvoiceId;
  final int? subhobby;
  final int? agCodesId;
  final Kota? kota;

  Map<String, dynamic> toJson() => _$KtaToJson(this);

  factory Kta.fromJson(Map<String, dynamic> json) => _$KtaFromJson(json);
}

@JsonSerializable()
class Kota {
  Kota({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.districtsId,
    this.districts,
  });

  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? name;
  final int? districtsId;
  final Districts? districts;

  Map<String, dynamic> toJson() => _$KotaToJson(this);

  factory Kota.fromJson(Map<String, dynamic> json) => _$KotaFromJson(json);
}

@JsonSerializable()
class Districts {
  Districts({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.citiesId,
    this.cities,
  });

  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? name;
  final int? citiesId;
  final Cities? cities;

  Map<String, dynamic> toJson() => _$DistrictsToJson(this);

  factory Districts.fromJson(Map<String, dynamic> json) =>
      _$DistrictsFromJson(json);
}

@JsonSerializable()
class Cities {
  Cities({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.provincesId,
    this.provinces,
  });

  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? name;
  final int? provincesId;
  final Provinces? provinces;

  Map<String, dynamic> toJson() => _$CitiesToJson(this);

  factory Cities.fromJson(Map<String, dynamic> json) => _$CitiesFromJson(json);
}

@JsonSerializable()
class Provinces {
  Provinces({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
  });

  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? name;

  Map<String, dynamic> toJson() => _$ProvincesToJson(this);

  factory Provinces.fromJson(Map<String, dynamic> json) =>
      _$ProvincesFromJson(json);
}

@JsonSerializable()
class Status {
  Status({
    this.status_kta,
  });
  final String? status_kta;

  Map<String, dynamic> toJson() => _$StatusToJson(this);

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
}
