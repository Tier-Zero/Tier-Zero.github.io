import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//import '../models/user_model.dart';

class CreateAccountUi extends StatefulWidget {
  @override
  CreateAccountUiState createState() => CreateAccountUiState();
}

createUser(User user) async {
  String baseUrl = "https://logbookzero.azurewebsites.net/api/User/";

  final response = await http.post(
    baseUrl,
    headers: {
      "Accept" : "application/json",
      "Content-Type" : "application/json"
    },
    body: json.encode(user)
  );
}

class User {
  String email;
  String pass;
  String firstName;
  String lastName;
}

class CreateAccountUiState extends State<CreateAccountUi> {
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  final firstNameController = new TextEditingController();
  final lastNameController = new TextEditingController();


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
                      "Create A New Account",
                      style: new TextStyle(
                        fontSize: 17,
                        color: Colors.black87
                      )
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter Your Email"
                      ),
                      controller: emailController,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter Your First Name"
                      ),
                      controller: firstNameController,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter Your Last Name"
                      ),
                      controller: lastNameController
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Create a Password"
                      ),
                      controller: passwordController,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    RaisedButton(
                      child: new Text("Create Account"),
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
                                      CircularProgressIndicator(
                                        backgroundColor: new Color(0xFF00bcd4),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 10),
                                      ),
                                      Text(
                                        "Creating Account",
                                        style: new TextStyle(
                                          fontSize: 15,
                                          color: new Color(0xFF00bcd4)
                                        )
                                      )
                                    ],
                                  ),
                                  padding: EdgeInsets.all(20),
                                ),
                              ),
                            );
                          }
                        );
                        User user = new User();
                        
                        user.email = emailController.text;
                        user.pass = passwordController.text;
                        user.firstName = firstNameController.text;
                        user.lastName = lastNameController.text;
                        await createUser(user);
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}