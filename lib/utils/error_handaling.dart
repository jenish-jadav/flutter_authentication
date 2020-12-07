import 'dart:async';
import 'dart:io';

class ErrorHandling {
  static String getErrorMessage(e) {
    String errorMessage = "Something is Wrong!";
    if (e is TimeoutException || e is SocketException) {
      errorMessage = "No Internet Connection!";
    }
    return errorMessage;
  }

  static const String SOMETHINF_IS_WRONG = "Something is Wrong!";
}
