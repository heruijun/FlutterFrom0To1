import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  Splash({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('启动页'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('进入欢迎页'),
          onPressed: () {
            Navigator.pushNamed(context, '/welcome');
          },
        ),
      ),
    );
  }
}
