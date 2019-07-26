import 'package:flutter/material.dart';

class FlutterAnimationPage extends StatefulWidget {
  FlutterAnimationPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FlutterAnimationPageState createState() => _FlutterAnimationPageState();
}

class _FlutterAnimationPageState extends State<FlutterAnimationPage> {
  List<String> eventList = List<String>();

  @override
  void initState() {
    super.initState();
    eventList.add("curved");
    eventList.add("Tween");
    eventList.add("Loading");
    eventList.add("fade");
    eventList.add("scale");
    eventList.add("AnimatedBuilder");
    eventList.add("Hero");
    eventList.add("StaggerAnimation");
    eventList.add("AnimatedSwitcher");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: eventList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: GestureDetector(
              child: Text(eventList[index]),
              onTap: () {
                Navigator.pushNamed(context, "/${eventList[index]}");
              },
            ),
          );
        },
      ),
    );
  }
}
