import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container"),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20.0),
        crossAxisSpacing: 10.0,
        crossAxisCount: 2,
        children: <Widget>[
          const Text('A'),
          const Text('B'),
          const Text('C'),
          const Text('D'),
          const Text('E'),
          const Text('F'),
        ],
      ),
    );
  }
}
