import 'package:flutter/material.dart';

class CurvedAnimationPage extends StatefulWidget {
  CurvedAnimationPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CurvedAnimationState createState() => _CurvedAnimationState();
}

class _CurvedAnimationState extends State<CurvedAnimationPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn)
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
    return AnimatedLogo(animation: animation);
  }
}

class AnimatedLogo extends AnimatedWidget {
  // The Tweens are static because they don't change.
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1.0);
  static final _sizeTween = Tween<double>(begin: 0.0, end: 300.0);

  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Scaffold(
        appBar: AppBar(
          title: Text("曲线动画"),
        ),
        body: Center(
          child: Opacity(
              opacity: _opacityTween.evaluate(animation),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                height: _sizeTween.evaluate(animation),
                width: _sizeTween.evaluate(animation),
                child: FlutterLogo(),
              )),
        ));
  }
}
