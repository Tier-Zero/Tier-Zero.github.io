import 'package:flutter/material.dart';

import './dashboard_page.dart';
import './profile_page.dart';
import './logbook_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key : key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 1;
  final _widgetOptions = [
    new ProfilePage(),
    new DashboardPage(),
    new LogbookPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: new Color(0xFF00bcd4),
          title: new Text("LogbookZero", style: new TextStyle(color: Colors.white)),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app),
              tooltip: "Logout",
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
        body: new Container(
          padding: new EdgeInsets.all(10.0),
          child: _widgetOptions.elementAt(_selectedIndex)
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("Profile")),
            BottomNavigationBarItem(icon: Icon(Icons.dashboard), title: Text("Dashboard")),
            BottomNavigationBarItem(icon: Icon(Icons.book), title: Text("Logbook")),
          ],
          currentIndex: _selectedIndex,
          fixedColor: new Color(0xFF00bcd4),
          onTap: _itemTapped,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => print("pressed"),
          tooltip: 'Add New Log Item',
          child: Icon(Icons.add),
          backgroundColor: new Color(0xFF00bcd4),
        ),
      ),
    );
  }


  void _itemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

