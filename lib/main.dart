import 'package:flutter/material.dart';
import 'package:mvp_sqflite/pages/home/home_page.dart';

import 'pages/login/login_page.dart';

void main() => runApp(MyApp());

final routes = {
  '/home': (BuildContext context) => HomePage(),
  '/': (BuildContext context) => LoginPage(),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter SQFlite',
      theme: ThemeData(primaryColor: Colors.teal),
      routes: routes,
    );
  }
}
