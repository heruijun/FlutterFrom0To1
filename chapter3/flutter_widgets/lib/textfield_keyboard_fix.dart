import 'package:flutter/material.dart';

class TextFieldKeyboardFix extends StatefulWidget {
  @override
  _TextFieldKeyboardFixState createState() => _TextFieldKeyboardFixState();
}

class _TextFieldKeyboardFixState extends State<TextFieldKeyboardFix> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('底部弹出遮挡输入框解决方案'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: RaisedButton(
              child: Text('弹出键盘'),
              onPressed: () {
                showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => new KeyboardTestWidget())
                    .then((result) {});
              },
            ),
          ),
        ));
  }
}

class KeyboardTestWidget extends StatelessWidget {
  const KeyboardTestWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: TextField(
                decoration: InputDecoration(hintText: 'adddrss'),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(hintText: 'adddrss'),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(hintText: 'adddrss'),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(hintText: 'adddrss'),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(hintText: 'adddrss'),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(hintText: 'adddrss'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
