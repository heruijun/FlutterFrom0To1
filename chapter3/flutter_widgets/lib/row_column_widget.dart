import 'package:flutter/material.dart';

class RowColumnWidget extends StatefulWidget {
  RowColumnWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RowColumnState createState() => _RowColumnState();
}

class _RowColumnState extends State<RowColumnWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Row Column"),
        ),
        body: Row(
          textDirection: TextDirection.rtl,   // 从右到左
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text("A",
                  style: new TextStyle(color: Colors.white, fontSize: 25.0)),
            ),
            Spacer(
              flex: 1,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text("B",
                  style: new TextStyle(color: Colors.white, fontSize: 25.0)),
            ),
            Spacer(
              flex: 1,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text("C",
                  style: new TextStyle(color: Colors.white, fontSize: 25.0)),
            ),
          ],
        ));
  }
}
