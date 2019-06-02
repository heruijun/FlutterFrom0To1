import 'package:flutter/material.dart';

class Hero2AnimationPage extends StatefulWidget {
  Hero2AnimationPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Hero2AnimationState createState() => _Hero2AnimationState();
}

class _Hero2AnimationState extends State<Hero2AnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero动画"),
      ),
      body: Center(
        child: Hero(
          tag: 'hero1',
          child: CustomLogo(
            size: 300.0,
          ),
        ),
      ),
    );
  }
}

class CustomLogo extends StatelessWidget {
  final double size;

  CustomLogo({this.size = 200.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black26,
      width: size,
      height: size,
      child: Center(
        child: FlutterLogo(
          size: 250.0,
        ),
      ),
    );
  }
}
