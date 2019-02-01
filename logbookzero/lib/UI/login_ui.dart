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
      color: new Color(0xFF00bcd4),
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              elevation: 15,
              child: new Padding(
                padding: EdgeInsets.all(20),
                child: new Column(
                  children: <Widget>[
                    Text(
                      "Please Login into Existing Accont",
                      style: new TextStyle(
                        fontSize: 17,
                        color: Colors.black87
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter your Email"
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter your Password"
                      ),
                      obscureText: true
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    RaisedButton(
                      child: Text("Login"),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/home');
                      }
                    )
                  ],
                )
              ),
            )
          ],
        )
      ),
    );
  }
}