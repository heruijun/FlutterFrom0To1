import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  Welcome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('欢迎页'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('进入app首页'),
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/homepage', (Route<dynamic> route) => false);
          },
        ),
      ),
    );
  }
}
