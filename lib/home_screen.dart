import 'dart:developer';

import 'package:demo_flutter/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  displaySnack() {
    log("button click");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              log("notification clicked");
            },
          ),
          IconButton(
            icon: Icon(Icons.power_settings_new),
            onPressed: () async {
              SharedPreferences pref=await SharedPreferences.getInstance();
              await pref.setBool("is_login", false);
              Navigator.pushReplacement(context,new MaterialPageRoute(builder: (BuildContext buildContext)=>SplashScreen()));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(children: <Widget>[
              Icon(
                Icons.info,
                color: Colors.blue[700],
              ),
              Text(
                'Hey!',
                style: TextStyle(fontSize: 25.0, color: Colors.blue),
              ),
              Text(
                'Dashboard!',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
