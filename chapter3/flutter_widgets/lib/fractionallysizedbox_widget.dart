import 'package:flutter/material.dart';

class FractionallySizedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FractionallySizedBox"),
      ),
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                color: Colors.blue,
                height: 130.0,
                width: 130.0,
                padding: EdgeInsets.all(5.0),
                child: new FractionallySizedBox(
                  alignment: Alignment.topLeft,
                  widthFactor: 1.5,
                  heightFactor: 0.5,
                  child: new Container(
                    color: Colors.yellow,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 60.0),
                child: Text(
                  "widthFactor: 1.5\nheightFactor: 0.5",
                  style: new TextStyle(fontSize: 20.0),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0),
          ),
          Row(
            children: <Widget>[
              Container(
                color: Colors.blue,
                height: 130.0,
                width: 130.0,
                padding: EdgeInsets.all(5.0),
                child: new FractionallySizedBox(
                  alignment: Alignment.topLeft,
                  widthFactor: null,
                  heightFactor: 0.5,
                  child: new Container(
                    color: Colors.yellow,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 60.0),
                child: Text(
                  "widthFactor: null\nheightFactor: 0.5",
                  style: new TextStyle(fontSize: 20.0),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0),
          ),
          Row(
            children: <Widget>[
              Container(
                color: Colors.blue,
                height: 130.0,
                width: 130.0,
                padding: EdgeInsets.all(5.0),
                child: new FractionallySizedBox(
                  alignment: Alignment.topLeft,
                  widthFactor: 1.5,
                  heightFactor: null,
                  child: new Container(
                    color: Colors.yellow,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 60.0),
                child: Text(
                  "widthFactor: 1.5\nheightFactor: null",
                  style: new TextStyle(fontSize: 20.0),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0),
          ),
          Row(
            children: <Widget>[
              Container(
                color: Colors.blue,
                height: 130.0,
                width: 130.0,
                padding: EdgeInsets.all(5.0),
                child: new FractionallySizedBox(
                  alignment: Alignment.topLeft,
                  widthFactor: null,
                  heightFactor: null,
                  child: new Container(
                    color: Colors.yellow,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 60.0),
                child: Text(
                  "widthFactor: null\nheightFactor: null",
                  style: new TextStyle(fontSize: 20.0),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
