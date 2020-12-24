import 'dart:developer';
import 'package:demo_flutter/splash_screen.dart';
import 'package:demo_flutter/user_list.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  redirectToScreen(BuildContext context, Widget widget) {
    Navigator.push(context,
        new MaterialPageRoute(builder: (BuildContext buildContext) => widget));
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
              _showLogoutConfirmationDialog(context);
            },
          ),
        ],
      ),
      drawer: getDrawerList(context),
      body: getContent(),
    );
  }

  void _logoutClick(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool("is_login", false);
    Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
            builder: (BuildContext buildContext) => SplashScreen()));
  }

  Widget getContent() {
    return Center(
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
    );
  }

  Widget getDrawerList(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          getDrawerHeader(),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('User List'),
            onTap: () {
              redirectToScreen(context, UserList());
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.power_settings_new),
            title: Text('Logout'),
            onTap: () {
              _showLogoutConfirmationDialog(context);
              //Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  Widget getDrawerHeader() {
    return DrawerHeader(
      child: Text(
        'Jenish',
        style: TextStyle(color: Colors.white),
      ),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
      ),
    );
  }

  Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation!'),
          content: Text('Are you sure you want to Logout?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Logout'),
              onPressed: () {
                Navigator.of(context).pop();
                _logoutClick(context);
              },
            ),
          ],
        );
      },
    );
  }
}
