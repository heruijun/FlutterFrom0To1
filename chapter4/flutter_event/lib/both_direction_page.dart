import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BothDirectionPage extends StatefulWidget {
  @override
  _BothDirectionState createState() => new _BothDirectionState();
}

class _BothDirectionState extends State<BothDirectionPage> {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("事件竞争机制"),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: FlutterLogo(
                size: 100,
              ),
              onVerticalDragUpdate: (DragUpdateDetails e) {
                setState(() {
                  _top += e.delta.dy;
                });
                print("垂直胜出");
              },
              onHorizontalDragUpdate: (DragUpdateDetails e) {
                setState(() {
                  _left += e.delta.dx;
                });
                print("水平胜出");
              },
              onTapDown: (e) {
                print("按下");
              },
              onTapUp: (e) {
                print("松开");
              },
              onHorizontalDragEnd: (e) {
                print("水平移动结束");
              },
              onVerticalDragEnd: (e) {
                print("垂直移动结束");
              },
            ),
          )
        ],
      ),
    );
  }
}
