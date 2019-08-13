import 'package:flutter/material.dart';

class WeekdayRow extends StatelessWidget {
  Widget _weekdayContainer(String weekDay) => Expanded(
        child: Container(
          child: Center(
            child: DefaultTextStyle(
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
              ),
              child: Text(
                weekDay,
              ),
            ),
          ),
        ),
      );

  List<Widget> _renderWeekDays() {
    List<Widget> list = [];
    list.add(_weekdayContainer("周日"));
    list.add(_weekdayContainer("周一"));
    list.add(_weekdayContainer("周二"));
    list.add(_weekdayContainer("周三"));
    list.add(_weekdayContainer("周四"));
    list.add(_weekdayContainer("周五"));
    list.add(_weekdayContainer("周六"));
    return list;
  }

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _renderWeekDays(),
      );
}
