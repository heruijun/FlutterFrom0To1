import 'package:flutter/material.dart';
import 'package:flutter_routes/errorpage.dart';
import 'package:flutter_routes/homepage.dart';
import 'package:flutter_routes/navigator_with_result.dart';
import 'package:flutter_routes/page1.dart';
import 'package:flutter_routes/page2.dart';
import 'package:flutter_routes/page3.dart';
import 'package:flutter_routes/page4.dart';
import 'package:flutter_routes/page5.dart';
import 'package:flutter_routes/pageroutebuilderresult.dart';
import 'package:flutter_routes/splash.dart';
import 'package:flutter_routes/testpageroutebuilder.dart';
import 'package:flutter_routes/todo.dart';
import 'package:flutter_routes/welcome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter路由',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/page1': (context) => Page1(),
        '/page2': (context) => Page2(),
        '/page3': (context) => Page3(),
        '/page4': (context) => Page4(),
        '/page5': (context) => Page5(),
        '/todo': (context) => TodosScreen(),
        '/splash': (context) => Splash(),
        '/welcome': (context) => Welcome(),
        '/homepage': (context) => HomePage(),
        '/PageRouteBuilder': (context) => TestPageRouteBuilder(),
        '/PageRouteBuilderResult': (context) => PageRouteBuilderResult(),
      },
      onUnknownRoute: (RouteSettings setting) {
        String name = setting.name;
        print("未匹配到路由:$name");
        return new MaterialPageRoute(builder: (context) {
          return new ErrorPage();
        });
      },
      // home: Page1(),
//      home: TodosScreen(
//        todos: List.generate(
//          20,
//          (i) => Todo(
//                'Todo $i',
//                'A description of what needs to be done for Todo $i',
//              ),
//        ),
//      ),
//      home: HomeScreen(),
//      home: Splash(),
      home: TestPageRouteBuilder(),
    );
  }
}
