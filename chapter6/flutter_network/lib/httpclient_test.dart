import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class HttpClientTest extends StatefulWidget {
  HttpClientTest({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HttpClientTestState createState() => _HttpClientTestState();
}

class _HttpClientTestState extends State<HttpClientTest> {
  String _responseText = "";

  _loadData() async {
    try {
      HttpClient httpClient = new HttpClient();
      HttpClientRequest request =
          await httpClient.getUrl(Uri.parse("https://www.phei.com.cn"));
      HttpClientResponse response = await request.close();
      _responseText = await response.transform(Utf8Decoder()).join();
      print(_responseText);
      httpClient.close();
    } catch (_) {
      print('请求异常：' + _.toString());
    }
  }

  _loadDataPostMethod() async {
    try {
      HttpClient httpClient = new HttpClient();
      HttpClientRequest request =
          await httpClient.postUrl(Uri.parse("https://post.example.com"));
      request.headers.set('content-type', 'application/json');
      Map jsonMap = {'userid': '10000'};
      request.add(utf8.encode(json.encode(jsonMap)));
      HttpClientResponse response = await request.close();
      _responseText = await response.transform(Utf8Decoder()).join();
      print(_responseText);
      httpClient.close();
    } catch (_) {
      print('请求异常：' + _.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HttpClient"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('HttpClient的get方式请求网络'),
            onPressed: () {
              _loadData();
            },
          )
        ],
      ),
    );
  }
}
