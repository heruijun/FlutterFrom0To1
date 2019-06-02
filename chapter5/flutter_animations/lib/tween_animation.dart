import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  TweenAnimation({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TweenAnimationState createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener(() {
        setState(() {
          print(animation.value);
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("补间动画"),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          height: animation.value,
          width: animation.value,
          child: FlutterLogo(),
        ));
  }
}
