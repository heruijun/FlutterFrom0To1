import 'package:flutter/material.dart';

class FlexWidget extends StatefulWidget {
  FlexWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FlexWidgetState createState() => _FlexWidgetState();
}

class _FlexWidgetState extends State<FlexWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flex"),
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 400.0,
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ),
            ),
            Container(
                height: 120.0,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // 子组件的排列方式为主轴两端对齐
                  children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.blue,
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.red,
                        ))
                  ],
                ))
          ],
        ));
  }
}
