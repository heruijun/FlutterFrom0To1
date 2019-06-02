import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {

  Page1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page1'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('跳转到Page2'),
          onPressed: () {
            //            Navigator.of(context).push(
            //              new MaterialPageRoute(
            //                builder: (context) {
            //                  return new Page2();
            //                },
            //              ),
            //            );
            Navigator.pushNamed(context, '/page2');
          },
        ),
      ),
    );
  }
}
