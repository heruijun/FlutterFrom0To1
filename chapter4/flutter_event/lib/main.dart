import 'package:flutter/material.dart';
import 'package:flutter_event/both_direction_page.dart';
import 'package:flutter_event/drag_page.dart';
import 'package:flutter_event/event_page.dart';
import 'package:flutter_event/gesture_detector_page.dart';
import 'package:flutter_event/gesture_recognizer_page.dart';
import 'package:flutter_event/listener_page.dart';
import 'package:flutter_event/pointer_event_ignore_page.dart';
import 'package:flutter_event/scale_page.dart';
import 'package:flutter_event/scroll_status_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter事件处理',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/Listener': (context) => ListenerPage(),
        '/PointerEvent': (context) => PointerEventIgnorePage(),
        '/GestureDetector': (context) => GestureDetectorPage(),
        '/Drag': (context) => DragPage(),
        '/Scale': (context) => ScalePage(),
        '/GestureRecognizer': (context) => GestureRecognizerPage(),
        '/BothDirection': (context) => BothDirectionPage(),
        '/NotificationListener': (context) => ScrollStatusPage()
      },
      home: FlutterEventPage(title: 'Flutter事件处理'),
    );
  }
}