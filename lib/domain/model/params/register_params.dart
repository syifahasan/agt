
import 'package:json_annotation/json_annotation.dart';
part 'register_params.g.dart';

@JsonSerializable()
class RegisterParams {
  final String? name;
  final String? phone;
  final String? dateOfBirth;
  final int? gender;
  final int? villages;
  final String? instagram;

  RegisterParams({this.name, this.phone, this.dateOfBirth, this.gender, this.villages, this.instagram});

  Map<String, dynamic> toJson() => _$RegisterParamsToJson(this);

  factory RegisterParams.fromJson(Map<String, dynamic> json) =>
      _$RegisterParamsFromJson(json);

}