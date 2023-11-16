import 'package:json_annotation/json_annotation.dart';
part 'check_code_params.g.dart';

@JsonSerializable()
class CheckCodeParams {
  final String? code;
  final String? latitude;
  final String? longitude;

  CheckCodeParams({this.code, this.latitude, this.longitude});

  Map<String, dynamic> toJson() => _$CheckCodeParamsToJson(this);

  factory CheckCodeParams.fromJson(Map<String, dynamic> json) =>
      _$CheckCodeParamsFromJson(json);
}
