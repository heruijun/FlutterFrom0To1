import 'package:flutter/material.dart';
import 'package:flutter_animations/animatedbuilder.dart';
import 'package:flutter_animations/animation_page.dart';
import 'package:flutter_animations/fade.dart';
import 'package:flutter_animations/hero_animation.dart';
import 'package:flutter_animations/loading.dart';
import 'package:flutter_animations/curved_animation.dart';
import 'package:flutter_animations/stagger_demo.dart';
import 'package:flutter_animations/tween_animation.dart';

import 'animated_switcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter动画',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/curved': (context) => CurvedAnimationPage(),
        '/Tween': (context) => TweenAnimation(),
        '/Loading': (context) => LoadingPage(),
        '/fade': (context) => Fade(),
        '/AnimatedBuilder': (context) => AnimatedBuilderPage(),
        '/Hero': (context) => HeroAnimationPage(),
        '/StaggerAnimation': (context) => StaggerDemo(),
        '/AnimatedSwitcher': (context) => AnimatedSwitcherDemo(),
      },
      home: FlutterAnimationPage(title: 'Flutter动画'),
    );
  }
}
