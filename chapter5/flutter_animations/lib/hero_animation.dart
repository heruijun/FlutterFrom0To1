import 'package:flutter/material.dart';
import 'package:flutter_animations/hero2_animation.dart';

class HeroAnimationPage extends StatefulWidget {
  HeroAnimationPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HeroAnimationState createState() => _HeroAnimationState();
}

class _HeroAnimationState extends State<HeroAnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero动画"),
      ),
      body: GestureDetector(
        child: Hero(
          tag: 'hero1',
          child: CustomLogo(
            size: 200.0,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => Hero2AnimationPage(),
            ),
          );
        },
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
          size: 150.0,
        ),
      ),
    );
  }
}
