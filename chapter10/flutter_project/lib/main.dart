import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:flutter_baidumap/text_view.dart';
import 'package:flutter_crash_report/flutter_crash_report.dart';

void main() async {
  bool isInDebugMode = false;

  FlutterError.onError = (FlutterErrorDetails details) {
    if (isInDebugMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
  };

  runZoned<Future<Null>>(() async {
    runApp(MaterialApp(home: TextViewExample()));
  }, onError: (error, stackTrace) async {
    await FlutterCrashReport()
        .reportCrash(error, stackTrace);
  });
}

class TextViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('错误日志上报')),
        body: Column(children: [
          Center(
            child: RaisedButton(
              onPressed: () {
                final crash = List()[69];
                debugPrint(crash);
              },
              child: Text('Crash'),
            ),
          ),
          new RaisedButton(
            child: new Text('Dart exception'),
            elevation: 1.0,
            onPressed: () {
              try {
                throw new StateError('This is a Dart exception.');
              } catch (error) {
                debugPrint("捕获到异常：" + error.toString());
                FlutterCrashReport()
                    .log('错误日志捕获：', priority: 200, tag: 'test');
                FlutterCrashReport().logException(error, error.stackTrace);
              }
            },
          ),
          Center(
            child: RaisedButton(
              onPressed: () {
                try {
                  final crash = List()[144];
                  debugPrint(crash);
                } catch (error) {
                  debugPrint("捕获到异常：" + error.toString());
                  FlutterCrashReport()
                      .log('错误日志捕获：', priority: 200, tag: 'test');
                  FlutterCrashReport().logException(error, error.stackTrace);
                }
              },
              child: Text('Manual error log'),
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: () {
                try {
                  throw new FormatException();
                } catch (exception, stack) {
                  debugPrint("捕获到异常：" + exception.toString());
                  FlutterCrashReport().logException(exception, stack);
                }
              },
              child: Text('Manual exception log'),
            ),
          ),
          new RaisedButton(
            child: new Text('async Dart exception'),
            elevation: 1.0,
            onPressed: () async {
              foo() async {
                throw new StateError('This is an async Dart exception.');
              }

              bar() async {
                await foo();
              }

              await bar();
            },
          ),
//          Center(
//              child: Container(
//                  padding: EdgeInsets.symmetric(vertical: 30.0),
//                  width: 130.0,
//                  height: 100.0,
//                  child: TextView(
//                    onTextViewCreated: _onTextViewCreated,
//                  ))),
//          Expanded(
//              flex: 3,
//              child: Container(
//                  color: Colors.blue[100],
//                  child: Center(child: Text("Hello from Flutter!"))))
        ]));
  }

//  void _onTextViewCreated(TextViewController controller) {
//    controller.setText('Hello from Android!');
//  }
}
