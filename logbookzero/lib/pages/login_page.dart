import 'package:flutter/material.dart';

import '../UI/login_ui.dart';
import '../UI//createAccount_ui.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  int _selectedIndex = 0;
  final _options = [
    new LoginUi(),
    new CreateAccountUi()
  ];


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        title: new Text(
          "Welcome To LogbookZero",
          style: new TextStyle(
            fontSize: 25,
            color: Colors.black87
          ),
        ),
      ),
      body: new Material(
        color: new Color(0xFF00bcd4),
        child:new Center(
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
                        "Please Login or Create an Account",
                        style: new TextStyle(
                          fontSize: 17,
                          color: Colors.black87
                        )
                      ),
                      _options.elementAt(_selectedIndex)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            title: Text("Login")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            title: Text("Create")
          )
        ],
        currentIndex: _selectedIndex,
        fixedColor: Color(0xFF00bcd4),
        onTap: _itemTapped
      )
    );
  }

  void _itemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
