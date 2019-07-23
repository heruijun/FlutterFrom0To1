import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GestureDetector实现360展物',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GestureDetectorPage(title: 'GestureDetector实现360展物'),
    );
  }
}

class GestureDetectorPage extends StatefulWidget {
  GestureDetectorPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GestureDetectorPageState createState() => _GestureDetectorPageState();
}

class _GestureDetectorPageState extends State<GestureDetectorPage> {
  int index = 1; // 第一张图片
  int count = 72; // 图片总数
  double initial = 0.0;
  final int DIRECTION_ANTICLOCKWISE = 1; // 逆时针
  final int DIRECTION_CLOCKWISE = -1; // 顺时针
  int direction;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    direction = DIRECTION_CLOCKWISE;
    _startTimer();
  }

  _startTimer() {
    _timer = Timer.periodic(new Duration(milliseconds: 90), (timer) {
      setState(() {});
      if (direction == DIRECTION_ANTICLOCKWISE) {
        if (index > 1) {
          index--;
          return;
        }
        // 重新回到第一张图
        index = count;
      } else if (direction == DIRECTION_CLOCKWISE) {
        if (index < count) {
          index++;
          return;
        }
        // 重新回到第一张图
        index = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () => _cancelTimer(),
              onPanStart: (e) => _cancelTimer(),
              onPanUpdate: (e) => _onTouchImage(e),
              // 在触屏结束之后，恢复自动旋转
              onPanEnd: (e) => _startTimer(),
              child: Image.asset(
                'images/product00${index}.png',
                fit: BoxFit.cover,
                width: width,
                height: height,
                // 该属性防止图片快速切换时白屏发生，在新图出前时保持旧的图
                gaplessPlayback: true,
                excludeFromSemantics: true,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onTouchImage(e) {
    if (e.delta.dx < 0) {
      direction = DIRECTION_CLOCKWISE;
    }
    if (e.delta.dx > 0) {
      direction = DIRECTION_ANTICLOCKWISE;
    }
    setState(() {
      index -= e.delta.dx.toInt();
    });
    // 防止取到不存在的图片报错
    if (index < 1) index = 1;
    if (index > count) index = count;
  }

  @override
  void dispose() {
    super.dispose();
    _cancelTimer();
  }

  void _cancelTimer() {
    _timer?.cancel();
  }
}
