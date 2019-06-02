import 'package:flutter/material.dart';

class GestureDetectorPage extends StatefulWidget {
  @override
  _GestureDetectorState createState() => new _GestureDetectorState();
}

class _GestureDetectorState extends State<GestureDetectorPage> {
  String _opName = "未检测到操作";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GestureDetector手势识别"),
      ),
      body: Center(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 240.0,
            height: 120.0,
            child: Text(
              _opName,
              style: TextStyle(color: Colors.white),
            ),
          ),
          onTap: () => _showEventText("Tap"),
          onTapUp: (e) => _showEventText("TapUp"),
          onTapDown: (e) => _showEventText("TapDown"),
          onTapCancel: () => _showEventText("TapCancel"),
          onDoubleTap: () => _showEventText("DoubleTap"),
          onLongPress: () => _showEventText("LongPress"),
          onVerticalDragDown: (e) => _showEventText("onVerticalDragDown"),
          onVerticalDragStart: (e) => _showEventText("onVerticalDragStart"),
          onVerticalDragUpdate: (e) => _showEventText("onVerticalDragUpdate"),
          onVerticalDragEnd: (e) => _showEventText("onVerticalDragEnd"),
          onVerticalDragCancel: () => _showEventText("onVerticalDragCancel"),
          onHorizontalDragDown: (e) => _showEventText("onHorizontalDragDown"),
          onHorizontalDragStart: (e) => _showEventText("onHorizontalDragStart"),
          onHorizontalDragUpdate: (e) => _showEventText("onHorizontalDragUpdate"),
          onHorizontalDragEnd: (e) => _showEventText("onHorizontalDragEnd"),
          onHorizontalDragCancel: () => _showEventText("onHorizontalDragCancel"),
//          onPanDown: (e) => _showEventText("onPanDown"),
//          onPanStart: (e) => _showEventText("onPanStart"),
//          onPanUpdate: (e) => _showEventText("onPanUpdate"),
//          onPanEnd: (e) => _showEventText("onPanEnd"),
//          onScaleStart: (e) => _showEventText("onScaleStart"),
//          onScaleUpdate: (e) => _showEventText("onScaleUpdate"),
//          onScaleEnd: (e) => _showEventText("onScaleEnd"),
        ),
      ),
    );
  }

  void _showEventText(String text) {
    setState(() {
      _opName = text;
    });
    print(_opName);
  }
}
