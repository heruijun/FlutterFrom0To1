import 'package:flutter/material.dart';

import 'fullscreen_demo.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '列表型日历选择组件',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<DateTime> selectResult1 = <DateTime>[];
  List<DateTime> selectResult2 = <DateTime>[];

  // 全屏方式
  _navigateFullScreenDemo(BuildContext context) async {
    selectResult1 = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FullScreenDemo()),
    );
  }

  // Dialog方式
  _navigateDailogDemo(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 600.0,
          child: FullScreenDemo(),
        );
      },
    ).then((result) {
      setState(() {
        selectResult2 = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("列表型日历"),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text('全屏日历'),
              onPressed: () {
                _navigateFullScreenDemo(context);
              },
            ),
            Text(
              selectResult1.toString(),
            ),
            FlatButton(
              child: Text('弹出框日历'),
              onPressed: () {
                _navigateDailogDemo(context);
              },
            ),
            Text(
              selectResult2.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
