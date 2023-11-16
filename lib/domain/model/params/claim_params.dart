import 'package:json_annotation/json_annotation.dart';
part 'claim_params.g.dart';

@JsonSerializable()
class ClaimParams {
  final CodeClaim? code_claim;
  final String? latitude;
  final String? longitude;
  final String? pin;

  ClaimParams({this.code_claim, this.latitude, this.longitude, this.pin});
  Map<String, dynamic> toJson() => _$ClaimParamsToJson(this);

  factory ClaimParams.fromJson(Map<String, dynamic> json) =>
      _$ClaimParamsFromJson(json);
}

@JsonSerializable()
class CodeClaim {
  final String? value;
  final String? key;
  CodeClaim({this.value, this.key});

  Map<String, dynamic> toJson() => _$CodeClaimToJson(this);

  factory CodeClaim.fromJson(Map<String, dynamic> json) =>
      _$CodeClaimFromJson(json);
}
