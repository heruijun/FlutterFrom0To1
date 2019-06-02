import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  Page4({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page4'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('跳转到Page5'),
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/page5', ModalRoute.withName('/page2'));
            },
          ),
          RaisedButton(
            child: Text('popUntil回退到page2'),
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/page2'));
            },
          ),
        ],
      )),
    );
  }
}
