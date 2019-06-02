import 'package:flutter/material.dart';

class FlutterEventPage extends StatefulWidget {
  FlutterEventPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FlutterEventPageState createState() => _FlutterEventPageState();
}

class _FlutterEventPageState extends State<FlutterEventPage> {
  List<String> eventList = List<String>();

  @override
  void initState() {
    super.initState();
    eventList.add("Listener");
    eventList.add("PointerEvent");
    eventList.add("GestureDetector");
    eventList.add("Drag");
    eventList.add("Scale");
    eventList.add("GestureRecognizer");
    eventList.add("BothDirection");
    eventList.add("GestureSlider");
    eventList.add("NotificationListener");
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
                    }),
              );
            }));
  }
}
