import 'dart:developer';
import 'package:demo_flutter/home_screen.dart';
import 'package:demo_flutter/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> {
  @override
  initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5));
    checkAuthentication();
  }

  checkAuthentication() async {
    log("Check Authentication");
    SharedPreferences pref = await SharedPreferences.getInstance();
    Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
            builder: (BuildContext buildContext) =>
                pref.getBool("is_login") != null && pref.getBool("is_login")
                    ? HomeScreen()
                    : LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[CircularProgressIndicator()],
        ),
      ),
    );
  }
}
