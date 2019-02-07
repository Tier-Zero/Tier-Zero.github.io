import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart' as shared;
import 'package:http/http.dart' as http;

class LoginUi extends StatefulWidget {
  @override
  LoginUiState createState() => LoginUiState();
}

loginInUser(email, password, context) async {
  String baseUrl = "https://logbookzero.azurewebsites.net/api/User/";
  String url = baseUrl + "?Email=" + email + "&Pass=" + password;
  

  final response = await http.get(url);
  String value = json.decode(response.body);
  return value;
  // if (value == "Good") {
  //   Navigator.of(context).pushNamed('/home');
  // } else if (value == "Not Good") {

  // }
}


class LoginUiState extends State<LoginUi> {
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  
  
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
                      "Please Login into Existing Account",
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
                      controller: emailController,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter your Password"
                      ),
                      controller: passwordController,
                      obscureText: true
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    RaisedButton(
                      child: Text("Login"),
                      onPressed: () async {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return new Center(
                              child: new Card(
                                elevation: 20,
                                child: new Padding(
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      new CircularProgressIndicator(
                                        backgroundColor: new Color(0xFF00bcd4)
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 10),
                                      ),
                                      new Text(
                                        "Signing In...",
                                        style: new TextStyle(
                                          fontSize: 15,
                                          color: new Color(0xFF00bcd4)
                                        )
                                      )
                                    ],
                                  ),
                                  padding: EdgeInsets.all(20),
                                ),
                              )
                            );
                          }
                        );
                        
                        String response = await loginInUser(emailController.text, passwordController.text, context);
                        final prefs = await shared.SharedPreferences.getInstance();
                        if (response == "Good") {
                          prefs.setString("CurrentUser", emailController.text);
                          Navigator.pop(context);
                          Navigator.of(context).pushNamed('/home');
                        } else if (response == "Not Good") {
                          Navigator.pop(context);
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return new Container(
                                alignment: Alignment.bottomCenter,
                                height: 150,
                                child: new Center(
                                  child: new Text(
                                    "Email/Password Incorrect",
                                    style: new TextStyle(
                                      fontSize: 20,
                                      color: Colors.redAccent
                                    ),
                                  ),
                                ),
                              );
                            }
                          );
                        }
                        
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