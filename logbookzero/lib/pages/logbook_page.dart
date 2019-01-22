import 'package:flutter/material.dart';

class LogbookPage extends StatefulWidget {
  @override
  LogbookPageState createState() => LogbookPageState();
}

class LogbookPageState extends State<LogbookPage> {
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Text("Logbook", 
        style: new TextStyle(
          fontSize: 20.0
        ),
      ),
    );  
  }
}