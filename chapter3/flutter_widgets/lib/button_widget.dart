import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("按钮"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            color: Colors.blue,
            child: Text("RaisedButton"),
            textColor: Colors.white,
            onPressed: () => {},
          ),
          FlatButton(
            textColor: Colors.blue,
            child: Text("FloatButton"),
            onPressed: () {
              print("FlatButton");
            },
          ),
          OutlineButton(
            textColor: Colors.blue,
            child: Text("OutlineButton"),
            onPressed: () {
              print("OutlineButton");
            },
          ),
          FloatingActionButton(
            child: Text("F"),
            onPressed: () {
              print("F");
            },
          )
        ],
      ),
    );
  }
}
