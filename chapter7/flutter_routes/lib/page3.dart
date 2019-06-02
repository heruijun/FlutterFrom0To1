import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {

  Page3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page3'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('跳转到Page4'),
          onPressed: () {
            Navigator.pushNamed(context, '/page4');
            // Navigator.of(context).pushReplacementNamed('/page4');     // page3没了
            // Navigator.popAndPushNamed(context, '/page4');
          },
        ),
      ),
    );
  }
}