import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioTest extends StatefulWidget {
  DioTest({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DioTestState createState() => _DioTestState();
}

class _DioTestState extends State<DioTest> {
  _loadData() async {
    try {
      Response response = await Dio().get("https://www.phei.com.cn");
      print(response);
    } catch (e) {
      print(e);
    }
  }

  _loadDataPostMethod() async {
    try {
      Response response = await Dio().post("https://www.phei.com.cn", data: {});
      print(response);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("http"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('dio的get方式请求网络'),
            onPressed: () {
              _loadData();
            },
          )
        ],
      ),
    );
  }
}
