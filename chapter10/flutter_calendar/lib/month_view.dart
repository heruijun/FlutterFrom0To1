import 'package:flutter/material.dart';

import 'day_number.dart';
import 'month_title.dart';
import 'utils/dates.dart';
import 'utils/screen_sizes.dart';

class MonthView extends StatefulWidget {
  const MonthView({
    @required this.context,
    @required this.year,
    @required this.month,
    @required this.padding,
    @required this.dateTimeStart,
    @required this.dateTimeEnd,
    @required this.onSelectDayRang,
    this.todayColor,
    this.monthNames,
  });

  final BuildContext context;
  final int year;
  final int month;
  final double padding;
  final Color todayColor;
  final List<String> monthNames;
  final DateTime dateTimeStart;
  final DateTime dateTimeEnd;
  final Function onSelectDayRang;

  double get itemWidth => getDayNumberSize(context, padding);

  @override
  _MonthViewState createState() => _MonthViewState();
}

class _MonthViewState extends State<MonthView> {
  DateTime selectedDate;

  Widget buildMonthDays(BuildContext context) {
    List<Row> dayRows = <Row>[];
    List<DayNumber> dayRowChildren = <DayNumber>[];

    int daysInMonth = getDaysInMonth(widget.year, widget.month);

    // 日 一 二 三 四 五 六
    int firstWeekdayOfMonth = DateTime(widget.year, widget.month, 2).weekday;

    for (int day = 2 - firstWeekdayOfMonth; day <= daysInMonth; day++) {
      DateTime moment = DateTime(widget.year, widget.month, day);
      final bool isToday = dateIsToday(moment);

      bool isDefaultSelected = false;
      if (widget.dateTimeStart == null &&
          widget.dateTimeEnd == null &&
          selectedDate == null) {
        isDefaultSelected = false;
      }
      if (widget.dateTimeStart == selectedDate &&
          widget.dateTimeEnd == null &&
          selectedDate?.day == day &&
          day > 0) {
        isDefaultSelected = true;
      }
      if (widget.dateTimeStart != null && widget.dateTimeEnd != null) {
        isDefaultSelected = (moment.isAtSameMomentAs(widget.dateTimeStart) ||
                    moment.isAtSameMomentAs(widget.dateTimeEnd)) ||
                moment.isAfter(widget.dateTimeStart) &&
                    moment.isBefore(widget.dateTimeEnd) &&
                    day > 0
            ? true
            : false;
      }

      dayRowChildren.add(
        DayNumber(
          size: widget.itemWidth,
          day: day,
          isToday: isToday,
          isDefaultSelected: isDefaultSelected,
          todayColor: widget.todayColor,
          onDayTap: (day) {
            selectedDate = DateTime(widget.year, widget.month, day);
            widget.onSelectDayRang(selectedDate);
          },
        ),
      );

      if ((day - 1 + firstWeekdayOfMonth) % DateTime.daysPerWeek == 0 ||
          day == daysInMonth) {
        dayRows.add(
          Row(
            children: List<DayNumber>.from(dayRowChildren),
          ),
        );
        dayRowChildren.clear();
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: dayRows,
    );
  }

  Widget buildMonthView(BuildContext context) {
    return Container(
      width: 7 * getDayNumberSize(context, widget.padding),
      margin: EdgeInsets.all(widget.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MonthTitle(
            month: widget.month,
            monthNames: widget.monthNames,
          ),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: buildMonthDays(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildMonthView(context),
    );
  }
}
