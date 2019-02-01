import 'package:flutter/material.dart';

class CreateAccountUi extends StatefulWidget {
  @override
  CreateAccountUiState createState() => CreateAccountUiState();
}

class CreateAccountUiState extends State<CreateAccountUi> {
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
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            TextFormField(
              decoration: const InputDecoration(hintText: "Enter Your Email"),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Enter Your First Name"
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Enter Your Last Name",
                hasFloatingPlaceholder: true
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10)
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Enter Your Password"
              ),
              obscureText: true,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10)
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Verify Your Password"
              ),
              obscureText: true,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15)
            ),
            RaisedButton(
              child: Text(
                "Create Account"
              ),
              onPressed: () => {},
            )
          ],
        ),
      ),
    );
  }
}
