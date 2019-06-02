import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpTest extends StatefulWidget {
  HttpTest({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HttpTestState createState() => _HttpTestState();
}

class _HttpTestState extends State<HttpTest> {
  _loadData() async {
    var client = http.Client();
    var uri = Uri.parse("https://www.phei.com.cn");
    http.Response response = await client.get(uri);
    print(utf8.decode(response.bodyBytes));
    client.close();
  }

  _loadDataPostMethod() async {
    var client = http.Client();
    Map<String, String> headerMap = {'userid': '10000'};
    http.Response response = await client
        .post("https://www.phei.com.cn", headers: headerMap, body: {});
    print(utf8.decode(response.bodyBytes));
    client.close();
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
            child: Text('http的get方式请求网络'),
            onPressed: () {
              _loadData();
            },
          )
        ],
      ),
    );
  }
}
