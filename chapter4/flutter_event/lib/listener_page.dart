import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ListenerPage extends StatefulWidget {
  @override
  _ListenerPageState createState() => new _ListenerPageState();
}

class _ListenerPageState extends State<ListenerPage> {
  String _opName = "未检测到操作";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listener原始指针事件"),
      ),
      body: Center(
        child: Listener(
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
          onPointerDown: (PointerDownEvent event) =>
              _showEventText('onPointerDown'),
          onPointerMove: (PointerMoveEvent event) =>
              _showEventText('onPointerMove'),
          onPointerUp: (PointerUpEvent event) => _showEventText('onPointerUp'),
          onPointerCancel: (PointerCancelEvent event) =>
              _showEventText('onPointerCancel'),
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
