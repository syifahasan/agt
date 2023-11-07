import 'package:json_annotation/json_annotation.dart';
part 'kta_params.g.dart';

@JsonSerializable()
class KtaParams {
  final String? name;
  final String? tgl_lahir;
  final String? address;
  final String? agama;
  final int? status;
  final int? kotareg;
  final int? pekerjaan;
  final String? email;
  final String? phonenumber;
  final String? nik;
  final int? status_kta;
  final String? asname;
  final int? jk;
  final int? subhobby;

  KtaParams({this.name, this.tgl_lahir, this.address, this.agama, this.status, this.kotareg, this.pekerjaan, this.email, this.phonenumber, this.nik, this.status_kta, this.asname, this.jk, this.subhobby});

  Map<String, dynamic> toJson() => _$KtaParamsToJson(this);

  factory KtaParams.fromJson(Map<String, dynamic> json) =>
      _$KtaParamsFromJson(json);
}