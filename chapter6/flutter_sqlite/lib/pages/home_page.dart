import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BuildContext _ctx;

  @override
  Widget build(BuildContext context) {
    _ctx = context;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home Page"),
      ),
      body: new Container(
        child: new Center(

        ),
      ),
    );
  }
}
