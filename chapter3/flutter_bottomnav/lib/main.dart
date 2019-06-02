import 'package:flutter/material.dart';
import 'package:flutter_animations/chat_page.dart';
import 'package:flutter_animations/favorite_page.dart';
import 'package:flutter_animations/help_page.dart';
import 'package:flutter_animations/home_page.dart';
import 'package:flutter_animations/layout_type.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: new MainPage(title: 'Flutter动画'),
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

  LayoutType _layoutSelection = LayoutType.home;

  Color _colorTabMatching({LayoutType layoutSelection}) {
    return _layoutSelection == layoutSelection ? Colors.deepOrange : Colors.grey;
  }

  BottomNavigationBarItem _buildItem(
      {IconData icon, LayoutType layoutSelection}) {
    String text = layoutName(layoutSelection);
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _colorTabMatching(layoutSelection: layoutSelection),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: _colorTabMatching(layoutSelection: layoutSelection),
        ),
      ),
    );
  }

  Widget _buildButtonNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(
            icon: Icons.home, layoutSelection: LayoutType.home),
        _buildItem(
            icon: Icons.favorite, layoutSelection: LayoutType.favorite),
        _buildItem(icon: Icons.chat, layoutSelection: LayoutType.chat),
        _buildItem(
            icon: Icons.help, layoutSelection: LayoutType.help),
      ],
      onTap: _onSelectTab,
    );
  }

  void _onLayoutSelected(LayoutType selection) {
    setState(() {
      _layoutSelection = selection;
    });
  }

  void _onSelectTab(int index) {
    switch (index) {
      case 0:
        _onLayoutSelected(LayoutType.home);
        break;
      case 1:
        _onLayoutSelected(LayoutType.favorite);
        break;
      case 2:
        _onLayoutSelected(LayoutType.chat);
        break;
      case 3:
        _onLayoutSelected(LayoutType.help);
        break;
    }
  }

  Widget _buildBody() {
    LayoutType layoutSelection = _layoutSelection;
    switch (layoutSelection) {
      case LayoutType.home:
        return HomePage();
      case LayoutType.favorite:
        return FavoritePage();
      case LayoutType.chat:
        return ChatPage();
      case LayoutType.help:
        return HelpPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildButtonNavBar(),
    );
  }
}
