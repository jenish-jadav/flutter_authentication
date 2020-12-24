import 'dart:async';
import 'dart:convert';
import 'package:demo_flutter/models/user_list_response.dart';
import 'package:demo_flutter/utils/api_urls.dart';
import 'package:demo_flutter/utils/error_handaling.dart';
import 'package:http/http.dart' as http;

class UserService {
  static Future<UserListResponse> userList() async {
    UserListResponse apiResponse = UserListResponse();
    try {
      final response = await http.post(ApiUrls.USER_LIST, body: {});
      if (response.statusCode == 200) {
        apiResponse = UserListResponse.fromJson(jsonDecode(response.body));
      } else {
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
