import 'package:flutter/material.dart';

class FlutterWidgetPage extends StatefulWidget {
  FlutterWidgetPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FlutterWidgetPageState createState() => _FlutterWidgetPageState();
}

class _FlutterWidgetPageState extends State<FlutterWidgetPage> {
  List<String> eventList = List<String>();

  @override
  void initState() {
    super.initState();
    eventList.add("Container");
    eventList.add("ConstrainedBox");
    eventList.add("FittedBox");
    eventList.add("FractionallySizedBox");
    eventList.add("Baseline");
    eventList.add("TextImageIcon");
    eventList.add("Button");
    eventList.add("Flex");
    eventList.add("Wrap");
    eventList.add("Row Column");
    eventList.add("AppBar");
    eventList.add("CustomAppBar");
    eventList.add("ListView");
    eventList.add("CustomScrollView");
    eventList.add("GridView");
    eventList.add("InheritedWidget");
    eventList.add("AlertDialogWidget");
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
