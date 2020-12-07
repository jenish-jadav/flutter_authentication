import 'dart:developer';
import 'package:demo_flutter/models/login_response.dart';
import 'package:flutter/material.dart';
import 'package:demo_flutter/services/authentication_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String username, password, errorMsg;
  bool isChecked = false;

  @override
  initState() {
    super.initState();
    setState(() {
      this.isChecked = false;
      this.errorMsg = "";
    });
  }

  loginClick() async {
    setErrorMessage("");
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      //log("Success: $username $password $isChecked");

      LoginResponse apiResponse =
          await AuthenticationService.checkLogin(username, password);
      if (apiResponse.isSuccess) log(apiResponse.user.name);
      setErrorMessage(apiResponse.message);
    } else {
      setErrorMessage("Fill Required information!");
    }
  }

  setErrorMessage(String msg) {
    setState(() {
      errorMsg = msg;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login"),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Image.network("https://picsum.photos/120"),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        onSaved: (String value) {
                          username = value;
                        },
                        decoration: InputDecoration(
                            hintText: "Username",
                            labelText: "Username",
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Username Required!";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        onSaved: (String value) {
                          password = value;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password",
                            labelText: "Password",
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Password Required!";
                          }
                          return null;
                        },
                      ),
                      Row(
                        children: [
                          Checkbox(
                            onChanged: (bool value) {
                              setState(() {
                                this.isChecked = value;
                              });
                            },
                            value: this.isChecked,
                          ),
                          Text("I accept the terms and conditions")
                        ],
                      ),
                      MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 18.0),
                        ),
                        padding: EdgeInsets.all(10),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: () => loginClick(),
                      ),
                      Text(errorMsg,
                          style: TextStyle(
                            color: Theme.of(context).errorColor,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
