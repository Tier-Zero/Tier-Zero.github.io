import 'package:flutter/material.dart';

import './pages/home_page.dart';
import './pages/landing_page.dart';

void main() => runApp(new LogbookZero());

class LogbookZero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LandingPage(),
      routes: <String, WidgetBuilder>{
        '/landing' : (BuildContext context) => new LandingPage(),
        '/home': (BuildContext context) => new HomePage()
      },
    );
  }
}
