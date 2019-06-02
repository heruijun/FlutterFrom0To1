import 'package:flutter/material.dart';

class NextPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第2页'),
      ),
      body: Center(
        child: Text('当前是第2页'),
      ),
    );
  }
}
