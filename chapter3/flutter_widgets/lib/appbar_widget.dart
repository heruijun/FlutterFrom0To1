import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('本地优惠'),
        leading: IconButton(
            icon: new Icon(Icons.face),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.playlist_play),
            tooltip: 'tooltip1',
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.playlist_add),
            tooltip: 'tooltip2',
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.playlist_add_check),
            tooltip: 'tooltip3',
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          FlutterLogo(
            size: 100.0,
            colors: Colors.red,
          )
        ],
      ),
    );
  }
}
