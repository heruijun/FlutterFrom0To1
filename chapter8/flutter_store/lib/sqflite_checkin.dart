import 'package:flutter/material.dart';
import 'package:flutter_store/check_in_result.dart';
import 'package:flutter_store/db_helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckInPage extends StatefulWidget {
  CheckInPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CheckInPageState createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage> {
  final TextEditingController textTitleEditingController =
      new TextEditingController();

  _save() {
    User user = User();
    user.name = textTitleEditingController.text;
    DBProvider.db.insert(user);
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          return new CheckInResult();
        },
      ),
    );
  }

  _removeData() {
    DBProvider.db.removeAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          TextField(
            controller: textTitleEditingController,
            autofocus: true,
            decoration: new InputDecoration(
              hintText: '请输入用户名',
            ),
          ),
          RaisedButton(
            child: Text('保存'),
            onPressed: _save,
          ),
          RaisedButton(
            child: Text('清除数据'),
            onPressed: _removeData,
          )
        ],
      )),
    );
  }
}
