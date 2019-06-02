import 'package:flutter/material.dart';
import 'package:flutter_routes/pageroutebuilderresult.dart';

class TestPageRouteBuilder extends StatefulWidget {
  @override
  _TestPageRouteBuilderState createState() => _TestPageRouteBuilderState();
}

class _TestPageRouteBuilderState extends State<TestPageRouteBuilder> {
  _onButtonTapCustom(Widget page) {
    Navigator.of(context).push(
      PageRouteBuilder<Null>(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return AnimatedBuilder(
            animation: animation,
            builder: (BuildContext context, Widget child) {
              return Opacity(
                opacity: animation.value,
                child: page,
              );
            },
          );
        },
        transitionDuration: Duration(milliseconds: 600),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageRouteBuilder'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          RaisedButton(
            padding: EdgeInsets.all(10.0),
            onPressed: () {
              _onButtonTapCustom(PageRouteBuilderResult());
            },
            child: Text(
              '调用自定义路由',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13.0),
            ),
          ),
          Hero(
            tag: "hero1",
            child: ClipOval(
              child: CustomLogo(
                size: 60.0,
              ),
            ),
          ),
          Hero(
              tag: "hero2",
              child: Material(
                color: Colors.transparent,
                child: Text(
                  "Hero效果",
                  style: TextStyle(fontSize: 14.0, color: Colors.black),
                ),
              ))
        ],
      )),
    );
  }
}

class CustomLogo extends StatelessWidget {
  final double size;

  CustomLogo({this.size = 200.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      width: size,
      height: size,
      child: Center(
        child: FlutterLogo(
          size: size,
        ),
      ),
    );
  }
}
