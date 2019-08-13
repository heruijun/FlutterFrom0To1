import 'package:flutter/material.dart';

import 'calendar_list.dart';

class FullScreenDemo extends StatefulWidget {
  FullScreenDemo({Key key}) : super(key: key);

  @override
  _FullScreenDemoState createState() => new _FullScreenDemoState();
}

class _FullScreenDemoState extends State<FullScreenDemo> {
  @override
  Widget build(BuildContext context) {
    return CalendarList(
      firstDate: DateTime(2019, 8),
      lastDate: DateTime(2020, 8),
//      selectedStartDate: DateTime(2019, 8, 28),
//      selectedEndDate: DateTime(2019, 9, 2),
      onSelectFinish: (selectStartTime, selectEndTime) {
        List<DateTime> result = <DateTime>[];
        result.add(selectStartTime);
        if (selectEndTime != null) {
          result.add(selectEndTime);
        }
        Navigator.pop(context, result);
      },
    );
  }
}
