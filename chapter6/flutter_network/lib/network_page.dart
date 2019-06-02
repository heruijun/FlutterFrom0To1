import 'package:flutter/material.dart';

class FlutterNetworkPage extends StatefulWidget {
  FlutterNetworkPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FlutterNetworkPageState createState() => _FlutterNetworkPageState();
}

class _FlutterNetworkPageState extends State<FlutterNetworkPage> {
  List<String> eventList = List<String>();

  @override
  void initState() {
    super.initState();
    eventList.add("HttpClient");
    eventList.add("Http");
    eventList.add("HttpDemo");
    eventList.add("Dio");
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
