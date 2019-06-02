import 'package:flutter/material.dart';
import 'package:flutter_network/pages/login/login_page.dart';
import 'package:flutter_network/pages/home_page.dart';

void main() => runApp(MyApp());

final routes = {
  '/login': (BuildContext context) => new LoginPage(),
  '/home': (BuildContext context) => new HomePage(),
  '/': (BuildContext context) => new LoginPage(),
};

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '注册登录',
      theme: new ThemeData(primarySwatch: Colors.brown),
      routes: routes,
    );
  }
}