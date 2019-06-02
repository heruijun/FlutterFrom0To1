import 'package:flutter/material.dart';

import './other_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String mainProfilePicture = "https://desk-fd.zol-img.com.cn/t_s144x90c5/g5/M00/02/07/ChMkJlbKy5GIKHO3AAXx0E0tcL8AALIsgMfpwoABfHo739.jpg";
  String otherProfilePicture = "https://desk-fd.zol-img.com.cn/t_s144x90c5/g5/M00/01/0D/ChMkJ1uYaZ-IKDkFAAR_I31LhRMAAroYwNnOnQABH87217.jpg";

  void switchUser() {
    String backupString = mainProfilePicture;
    this.setState((){
      mainProfilePicture = otherProfilePicture;
      otherProfilePicture = backupString;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("My Drawer App")),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Flutter开发者"),
              accountEmail: new Text("113805738@qq.com"),
              currentAccountPicture: new GestureDetector(
                onTap: () => print("点击事件"),
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(mainProfilePicture),
                )
              ),
              otherAccountsPictures: <Widget>[
                new GestureDetector(
                    onTap: () => switchUser(),
                    child: new CircleAvatar(
                      backgroundImage: new NetworkImage(otherProfilePicture),
                    )
                ),
              ],
              decoration: new BoxDecoration(
                image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new NetworkImage("https://desk-fd.zol-img.com.cn/t_s208x130c5/g4/M00/0F/02/Cg-4zFT5Wj-IQxAKABhgu3KD_twAAWK_ANBmYUAGGDT047.jpg")
                )
              ),
            ),
            new ListTile(
              title: new Text("常用组件"),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new OtherPage("常用组件")));
              }
            ),
            new ListTile(
              title: new Text("项目实战"),
              trailing: new Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new OtherPage("项目实战")));
                }
            ),
            new Divider(),
            new ListTile(
              title: new Text("关闭"),
              trailing: new Icon(Icons.cancel),
              onTap: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
      body: new Center(
        child: new Text("HomePage", style: new TextStyle(fontSize: 35.0),)
      )
    );
  }
}