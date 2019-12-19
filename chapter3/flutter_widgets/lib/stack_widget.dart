import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack"),
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
              Container(
                width: 90,
                height: 90,
                color: Colors.green,
              ),
              Container(
                width: 80,
                height: 80,
                color: Colors.blue,
              ),
            ],
          ),
          SizedBox(height: 10),
          Stack(
            // 对齐方式
            alignment: AlignmentDirectional.bottomEnd,
            overflow: Overflow.clip,
            children: <Widget>[
              Container(
                width: 200,
                height: 200,
                color: Colors.red,
              ),
              Container(
                width: 160,
                height: 90,
                color: Colors.green,
              ),
              Container(
                width: 80,
                height: 80,
                color: Colors.blue,
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            width: 160,
            height: 160,
            child: Stack(
              // alignment无效，会优先考虑Positioned定位
              alignment: AlignmentDirectional.bottomEnd,
              overflow: Overflow.visible,
              fit: StackFit.expand,
              children: <Widget>[
                Positioned(
                  left: 0.0,
                  top: 0.0,
                  child: Container(
                    width: 300,
                    height: 200,
                    color: Colors.red,
                  ),
                ),
                Positioned(
                  left: 0.0,
                  top: 0.0,
                  child: Container(
                    width: 160,
                    height: 90,
                    color: Colors.green,
                  ),
                ),
                Positioned(
                  left: 20.0,
                  top: 40.0,
                  child: Container(
                    width: 80,
                    height: 80,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
