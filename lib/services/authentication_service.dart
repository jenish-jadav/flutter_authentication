import 'dart:async';
import 'dart:convert';
import 'package:demo_flutter/models/api_response.dart';
import 'package:demo_flutter/models/login_response.dart';
import 'package:demo_flutter/utils/error_handaling.dart';
import 'package:http/http.dart' as http;

class AuthenticationService {
  static const String BASE_URL = "http://192.168.2.21:8080/";
  static const String LOGIN_URL = BASE_URL + "login";

  static Future<LoginResponse> checkLogin(
      String userName, String password) async {
    LoginResponse apiResponse = LoginResponse();
    try {
      final response = await http
          .post(LOGIN_URL, body: {"username": userName, "password": password});

      if (response.statusCode == 200) {
        apiResponse = LoginResponse.fromJson(jsonDecode(response.body));
      }
      if (apiResponse == null) {
        apiResponse.isSuccess = false;
        apiResponse.message = ErrorHandling.SOMETHINF_IS_WRONG;
      }
    } catch (e) {
      apiResponse.isSuccess = false;
      apiResponse.message = ErrorHandling.getErrorMessage(e);
    }
    return apiResponse;
  }
}
