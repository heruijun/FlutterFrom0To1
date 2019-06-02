import 'package:flutter/material.dart';
import 'package:flutter_network/dio_test.dart';
import 'package:flutter_network/http_demo.dart';
import 'package:flutter_network/http_test.dart';
import 'package:flutter_network/httpclient_test.dart';
import 'package:flutter_network/network_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '网络技术与异步编程',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/HttpClient': (context) => HttpClientTest(),
        '/Http': (context) => HttpTest(),
        '/HttpDemo': (context) => HttpDemo(),
        '/Dio': (context) => DioTest(),
      },
      home: FlutterNetworkPage(title: '网络技术与异步编程'),
    );
  }
}
