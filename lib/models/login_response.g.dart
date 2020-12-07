// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return LoginResponse()
    ..isSuccess = json['isSuccess'] as bool ?? false
    ..message = json['message'] as String
    ..user = json['data'] == null
        ? null
        : User.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'message': instance.message,
      'data': instance.user,
    };
