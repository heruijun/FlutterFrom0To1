import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container"),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              color: Colors.green,
              alignment: Alignment(0.0, 0.0),
              child: new Text("Container"),
              constraints: BoxConstraints(
                  maxHeight: 300.0,
                  maxWidth: 300.0,
                  minWidth: 200.0,
                  minHeight: 120.0),
            ),
          ),
          Container(
            color: Colors.blue,
            child: Text("Flutter"),
            constraints: BoxConstraints.expand(width: 250.0, height: 100.0),
          ),
          Container(
            margin: EdgeInsets.only(top: 60.0, left: 80.0),
            constraints: BoxConstraints.tightFor(width: 300.0, height: 150.0),
            decoration: BoxDecoration(
              border: Border.all(width: 3, color: Color(0xffaaaaaa)),
              // 实现阴影效果
              boxShadow: [
                BoxShadow(
                    color: Colors.black54,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4.0)
              ],
              // 实现渐变背景色，支持线性，径向渐变
              gradient: LinearGradient(
                  colors: [Colors.red, Colors.blue, Colors.yellow]),
            ),
            transform: Matrix4.rotationZ(.3),
            alignment: Alignment.center,
            child: Text(
              " 佩奇",
              style: TextStyle(color: Colors.white, fontSize: 30.0),
            ),
          ),
        ],
      ),
    );
  }
}
