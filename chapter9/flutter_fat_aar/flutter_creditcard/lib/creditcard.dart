import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreditcardModule extends StatefulWidget {
  CreditcardModule({Key key}) : super(key: key);

  @override
  _CreditcardPageState createState() => _CreditcardPageState();
}

class _CreditcardPageState extends State<CreditcardModule> {
  String _username;
  static const platform = const MethodChannel('pabank.flutter.plugin/battery');
  String _batteryLevel = 'Unknown battery level';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = '当前电量 $result %';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '举例',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('举例'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('通过MethodCannel获取电池电量'),
                onPressed: _getBatteryLevel,
              ),
              Text(_batteryLevel),
            ],
          ),
        ),
      ),
    );
  }
}
