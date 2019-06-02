import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {

  ErrorPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('路由未匹配到'),
      ),
      body: Center(
        child: Text('路由未匹配到'),
      ),
    );
  }
}
