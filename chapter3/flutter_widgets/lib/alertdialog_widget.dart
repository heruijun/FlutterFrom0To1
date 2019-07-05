import 'package:flutter/material.dart';

enum DialogDemoAction {
  cancel,
  agree,
}

const String _alertWithoutTitleText = '是否加入购物车？';

class AlertDialogWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void showDemoDialog<T>({BuildContext context, Widget child}) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((T value) {
      // The value passed to Navigator.pop() or null.
      if (value != null) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('你选择了: $value'),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle dialogTextStyle =
        theme.textTheme.subhead.copyWith(color: theme.textTheme.caption.color);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Alert Dialog"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            color: Colors.blue,
            child: Text("RaisedButton"),
            textColor: Colors.white,
            onPressed: () {
              showDemoDialog<DialogDemoAction>(
                context: context,
                child: AlertDialog(
                  content: Text(
                    _alertWithoutTitleText,
                    style: dialogTextStyle,
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: const Text('否'),
                      onPressed: () {
                        Navigator.pop(context, DialogDemoAction.cancel);
                      },
                    ),
                    FlatButton(
                      child: const Text('是'),
                      onPressed: () {
                        Navigator.pop(context, DialogDemoAction.agree);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _onClick() {}
}
