import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable()
class ApiResponse {
  @JsonKey(name: "isSuccess", defaultValue: false)
  bool isSuccess;

  @JsonKey(name: "message")
  String message;

  ApiResponse({this.isSuccess, this.message});

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}
