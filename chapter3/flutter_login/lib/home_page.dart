import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String tag = '首页';

  @override
  Widget build(BuildContext context) {

    final user = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/bg.jpeg'),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        '欢迎，kimihe',
        style: new TextStyle(color: Colors.white, fontSize: 20.0),
      ),
    );

    final info = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。 Flutter可以与现有的代码一起工作。在全世界，Flutter正在被越来越多的开发者和组织使用，并且Flutter是完全免费、开源的。",
        style: new TextStyle(color: Colors.white, fontSize: 20.0),
    ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.green,
            Colors.lightGreenAccent
          ]
        )
      ),
      child: Column(children: <Widget>[
        user, welcome, info,
      ],),
    );
    
    return Scaffold(
      body: body,
    );
  }
}