import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginUi extends StatefulWidget {
  @override
  LoginUiState createState() => LoginUiState();
}

class LoginUiState extends State<LoginUi> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
        child: new Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("Please Login or Create an Account",
              style: new TextStyle(fontSize: 17, color: Colors.black87)),
          Padding(padding: EdgeInsets.symmetric(vertical: 15)),
          TextFormField(
              decoration: const InputDecoration(hintText: "Enter Your Email"),
              keyboardType: TextInputType.emailAddress),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: "Enter Your Password"),
            keyboardType: TextInputType.text,
            obscureText: true,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
          ),
          RaisedButton(
            child: Text("Login"),
            onPressed: () {
              // Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/home');
            },
          )
        ],
      ),
    ));
  }
}
