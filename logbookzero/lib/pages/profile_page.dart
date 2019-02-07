import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart' as shared;

class ProfilePage extends StatefulWidget {
  @override
  ProfilePageState createState() => ProfilePageState();
}

loadAsyncData() async {
  final prefs = await shared.SharedPreferences.getInstance(); 

  print(prefs.getString("CurrentUser"));
}


class ProfilePageState extends State<ProfilePage> {

  @override
  void initState() {
    
    loadAsyncData();
  

  }


  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Padding(
        padding: EdgeInsets.all(10),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Card(
              elevation: 5,
              child: new Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Cameron Stark",
                      style: new TextStyle(
                        fontSize: 23
                      )
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2),
                    ),
                    Text(
                      "Total Hours: ",
                      style: new TextStyle(
                        fontSize: 19
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2),
                    ),
                    Text(
                      "Current Rating: ",
                      style: new TextStyle(
                        fontSize: 20
                      )
                    )
                  ],
                ),
              ),
            ),
            new Card(
              elevation: 5,
              child: new Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Rating and Licenses",
                      style: new TextStyle(
                        fontSize: 19
                      ),
                    ),
                    Divider(
                      color: Colors.black87
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      
                      children: <Widget>[
                        Text(
                          "Private License"
                        ),
                        Text(
                          "Exipres in 35 days"
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        )
      )
    );
  }
}