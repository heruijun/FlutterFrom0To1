import 'package:flutter/material.dart';

class ScalePage extends StatefulWidget {
  @override
  _ScaleState createState() => new _ScaleState();
}

class _ScaleState extends State<ScalePage> {
  double _size = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("缩放识别"),
      ),
      body: Center(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            child: FlutterLogo(size: _size,),
          ),
          onScaleUpdate: (ScaleUpdateDetails e) {
            setState(() {
              _size = 300 * e.scale.clamp(.5, 10.0);
            });
          },
        ),
      ),
    );
  }
}
