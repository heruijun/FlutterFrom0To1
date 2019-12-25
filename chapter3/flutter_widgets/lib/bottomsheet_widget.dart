import 'package:flutter/material.dart';

class BottomSheetWidget extends StatefulWidget {
  BottomSheetWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BottomSheet"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                  color: Theme.of(context).primaryColor,
                  child: Text('showModalBottomSheet'),
                  textColor: Colors.white,
                  onPressed: () => showModalBottomSheet(
                      context: context,
                      builder: (context) => _showBottomContent(context))),
              RaisedButton(
                  color: Theme.of(context).primaryColor,
                  child: Text('showModalBottomSheet ShapeBorder'),
                  textColor: Colors.white,
                  onPressed: () => showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      builder: (context) => _showBottomContent(context))),
            ],
          ),
        ));
  }

  _showBottomContent(context) {
    return SafeArea(
        child: Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text('分享给朋友'),
            onTap: () {
              Navigator.pop(context);
              print('action 1');
            },
          ),
          ListTile(
            title: Text('分享到朋友圈'),
            onTap: () {
              Navigator.pop(context);
              print('action 2');
            },
          ),
        ],
      ),
    ));
  }
}
