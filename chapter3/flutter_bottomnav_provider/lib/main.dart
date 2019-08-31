import 'package:flutter/material.dart';
import 'package:flutter_animations/chat_page.dart';
import 'package:flutter_animations/favorite_page.dart';
import 'package:flutter_animations/help_page.dart';
import 'package:flutter_animations/home_page.dart';
import 'package:flutter_animations/provider/model/bottom_nav_bar_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: ChangeNotifierProvider<BottomNavBarProvider>(
        child: new MainPage(title: 'Flutter底部导航Provider版'),
        builder: (BuildContext context) => BottomNavBarProvider(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var currentTab = [
    HomePage(),
    FavoritePage(),
    ChatPage(),
    HelpPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavBarProvider>(context);
    return new Scaffold(
      body: currentTab[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: provider.currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.favorite),
            title: new Text('收藏'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text('聊天'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            title: Text('帮助'),
          ),
        ],
        onTap: (index) {
          provider.currentIndex = index;
        },
      ),
    );
  }
}
