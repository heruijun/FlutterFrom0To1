import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureRecognizerPage extends StatefulWidget {
  @override
  _GestureRecognizerState createState() => new _GestureRecognizerState();
}

class _GestureRecognizerState extends State<GestureRecognizerPage> {
  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("GestureRecognizer"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Room is not ",
                    style: TextStyle(fontSize: 25.0),
                  ),
                  TextSpan(
                    text: "built",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationThickness: 3.0,
                      decorationColor: Colors.amber,
                      decorationStyle: TextDecorationStyle.solid,
                    ),
                    recognizer: _tapGestureRecognizer
                      ..onTap = () {
                        showInSnackBar("built: 建造");
                      },
                  ),
                  TextSpan(
                    text: " in one day.",
                    style: TextStyle(fontSize: 25.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(
      new SnackBar(
        content: new Text(
          value,
          style: TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}
