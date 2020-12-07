import 'package:demo_flutter/models/api_response.dart';
import 'package:demo_flutter/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends ApiResponse {
  @JsonKey(name: "data")
  User user;

  LoginResponse();

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
