import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Column(
        children: <Widget>[
          Expanded(
            child: new Text("Dashboard")
          ),
        ],
      ),
    );
  }
} 