import 'package:demo_flutter/models/api_response.dart';
import 'package:demo_flutter/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_list_response.g.dart';

@JsonSerializable()
class UserListResponse extends ApiResponse {
  @JsonKey(name: "data")
  List<User> users;

  UserListResponse();

  factory UserListResponse.fromJson(Map<String, dynamic> json) =>
      _$UserListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserListResponseToJson(this);
}
