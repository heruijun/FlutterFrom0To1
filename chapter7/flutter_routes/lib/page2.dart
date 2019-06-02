import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {

  Page2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page2'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('跳转到Page3'),
          onPressed: () {
            Navigator.pushNamed(context, '/page3');
          },
        ),
      ),
    );
  }
}