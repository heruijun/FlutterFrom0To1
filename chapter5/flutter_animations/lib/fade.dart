import 'package:flutter/material.dart';

class Fade extends StatefulWidget {
  Fade({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FadeState createState() => _FadeState();
}

class _FadeState extends State<Fade> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("渐入淡出动画"),
      ),
      body: Center(
        child: AnimatedOpacity(
            opacity: _visible ? 1.0 : 0.0,
            duration: Duration(milliseconds: 500),
            child: FlutterLogo(
              size: 100.0,
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: "Toggole Opacity",
        child: Icon(Icons.flip),
      ),
    );
  }
}
