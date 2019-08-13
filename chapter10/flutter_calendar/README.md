# Flutter实现一个酷炫带动画的列表型多选日历组件

由于项目需要，用Flutter重构了之前用Android做过的日历组件，整体效果感觉不错，流畅度甚至超过原来的，这里需要提一下官网的做法，如下：

```
    var date = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: date,
      firstDate: date,
      lastDate: date.add(
        Duration(days: 30),
      ),
    );
```

官方的做法就是showDatePicker实现的，支持MD和IOS的风格，但据我了解，只支持单选，不支持开始和结束日期的区间选择，体验也与我需要的效果不一致，所以经过考虑之后，还是决定自己写一个。

## 先上效果图
![](https://raw.githubusercontent.com/heruijun/flutter_calendar_list/master/calendar.gif)

## 实现的功能和需求
1. 绘制“日”，“月”，“年”组件，年嵌套多个月，月嵌套多个周，然后再是天
2. 绘制日历头部与底部确认选择按钮
3. 支持某一天单选，开始日期和结束日期多选，反向选择（先选结束日期再选开始日期），跨月选择，取消选择等事件
4. 对外暴露CalendarList组件，这个组件是List<MonthView>类型，也就是说它是多个月的集合

下面分段对部分代码进行描述。

## 先从调用入口进行分析
下面就是一个日历选择组件的调用方式：

```
return CalendarList(
  firstDate: DateTime(2019, 8),
  lastDate: DateTime(2020, 8),
  selectedStartDate: DateTime(2019, 8, 28),
  selectedEndDate: DateTime(2019, 9, 2),
  onSelectFinish: (selectStartTime, selectEndTime) {
    List<DateTime> result = <DateTime>[];
    result.add(selectStartTime);
    if (selectEndTime != null) {
      result.add(selectEndTime);
    }
    Navigator.pop(context, result);
  },
);
```

其中firstDate和lastDate是选择的月份列表，本例中，从2019年8月开始算起，结束时间是2020年8月，然后又有2个参数selectedStartDate和selectedEndDate，这2个参数是给定的默认选中区间，本例中默认选中了2019/8/28和2019/9/2之间的所有日期，默认选中一般是记录用户上次选中的结果。onSelectFinish就是选完之后的回调，以上这些参数是根据实际业务可以灵活设置的。

## 底部弹出方式的日期方式
这块其实很简单，CalendarList本身就支持从底部滑出，调用的方法是showModalBottomSheet，代码如下：

```
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 600.0,
          child: FullScreenDemo(),
        );
      },
    ).then((result) {
      setState(() {
        selectResult2 = result;
      });
    });
```

其中日历放在了FullScreenDemo里，通过Container包一层设置一个高度，然后就可以通过showModalBottomSheet方法从底部滑出。

## CalendarList滚动列表绘制
通过上面的讲述，我们了解了如何使用CalendarList组件，那么我们看看源码里面具体做了哪些。笔者在实现该功能时把MonthView作为SliverList的一个build item。放置到CustomScrollView的Sliver里面，这里复习一下，Sliver的作用其实就是“粘合剂”的作用，把多个组件粘合起来形成一个滚动区域，布局如下：

```
CustomScrollView(
    slivers: <Widget>[
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            int month = index + monthStart;
            DateTime calendarDateTime = DateTime(yearStart, month);
            return _getMonthView(calendarDateTime);
          },
          childCount: count,
        ),
      ),
    ],
),
```

在BuildContext中，通过index与monthStart想加，计算出日历，即8，9，10，11...这些月份，需要注意的是DateTime里面传入的month参数如果超过了12，则前面的年会自动“进位”（Flutter设置的太贴心了），好了，在_getMonthView里面，我们看看return了一个什么样的Widget，代码如下：

```
  Widget _getMonthView(DateTime dateTime) {
    int year = dateTime.year;
    int month = dateTime.month;
    return MonthView(
      context: context,
      year: year,
      month: month,
      padding: HORIZONTAL_PADDING,
      dateTimeStart: selectStartTime,
      dateTimeEnd: selectEndTime,
      todayColor: Colors.deepOrange,
      onSelectDayRang: (dateTime) => onSelectDayChanged(dateTime),
    );
  }
```

好，这里就是传入了MonthView，设置了年、月，dateTimeStart，dateTimeEnd，today高亮颜色这些参数。下面，我们看看MonthView里面又做了啥

## MonthView绘制
MonthView其实就是真正绘制每个月有多少个星期，然后每个星期的7天展示，通过每行（Row）放置7个DayNumber组件，根据每周循环出整个月的数据，代码片段如下：

```
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
```

这样，一个日历就出来了，不过光有这些是不行的，因为还没开始做选择器，即（单选，多选，反选，取消这些），需要高亮出来，高亮的逻辑大致如下：

```
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
```

上述代码可以说是一部分核心逻辑，会根据CalendarList传入的选择区间通过DateTime moment进行筛选，如果是在区间范围内，则选中该区间，猜猜怎么让DayNumber高亮起来？
OK，其实知道了高亮区间之后，在DayNumber里就可以传入默认选中isDefaultSelected，下面，我们看看DayNumber又做了啥

## DayNumber绘制
和CalendarList，MonthView比起来，DayNumber就是小弟了，具体的绘制代码如下：

```
  Widget _dayItem() {
    return Container(
      width: widget.size - itemMargin * 2,
      height: widget.size - itemMargin * 2,
      margin: EdgeInsets.all(itemMargin),
      alignment: Alignment.center,
      decoration: (isSelected && widget.day > 0)
          ? BoxDecoration(color: Colors.blue)
          : widget.isToday ? BoxDecoration(color: widget.todayColor) : null,
      child: Text(
        widget.day < 1 ? '' : widget.day.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: (widget.isToday || isSelected) ? Colors.white : Colors.black87,
          fontSize: 15.0,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
```

其中Container里面声明了decoration，通过BoxDecoration设置了背景色，代码中把选中的效果优先于today高亮色，这样就可以覆盖当天的颜色，具体的Day则是Text绘制的。

通过上面的描述，我们了解了Calendar，MonthView，DayNumber三者的关系，核心代码差不多就这些吧。

下面，我们再看看单选，多选，反选，取消这些逻辑是怎么实现的

## 单选，多选，反选，取消逻辑实现
代码有点长，先贴出来，然后我们分析一下：

```
  // 选项处理回调
  void onSelectDayChanged(dateTime) {
    if (selectStartTime == null && selectEndTime == null) {
      selectStartTime = dateTime;
    } else if (selectStartTime != null && selectEndTime == null) {
      selectEndTime = dateTime;
      // 如果选择的开始日期和结束日期相等，则清除选项
      if (selectStartTime == selectEndTime) {
        setState(() {
          selectStartTime = null;
          selectEndTime = null;
        });
        return;
      }
      // 如果用户反选，则交换开始和结束日期
      if (selectStartTime?.isAfter(selectEndTime)) {
        DateTime temp = selectStartTime;
        selectStartTime = selectEndTime;
        selectEndTime = temp;
      }
    } else if (selectStartTime != null && selectEndTime != null) {
      selectStartTime = null;
      selectEndTime = null;
      selectStartTime = dateTime;
    }
    setState(() {
      selectStartTime;
      selectEndTime;
    });
  }
```

onSelectDayChanged其实就是对用户点击DayNumber行为的事件回调，这是一个典型的子组件调用父组件改变其状态的代码段，通过selectStartTime和selectEndTime是否为null判断用户的点击行为落在哪个if else里面，通过setState重新设置开始和结束日期，这样就可以“刷新”MonthView里面的DayNumber选择范围，好了，大致的核心源码就分析到这里。

## 总结一下，通过本例可以学习到以下知识点
1. 路由参数传递和参数回传
2. 父子组件正向与逆向通信
3. 日期函数DateTime的运用
4. Sliver在CustomScrollView中的运用
5. 日历绘制方式
6. 底部弹出组件使用方式
7. 其他各种布局技巧及细节

## 可以改善的地方
1. 国际化支持
2. 自定义颜色传入
3. 后续发布到Flutter Pub

## 代码地址
本例中相关的代码放在

github地址：[https://github.com/heruijun/flutter_calendar_list](https://github.com/heruijun/flutter_calendar_list)

此例已经作为补充内容添加至我的《Flutter从0到1构建大前端应用》一书的源码中，是一个知识点比较多的综合案例，再版时会根据读者意见考虑加入到书中讲解。

## 新书推荐
大家好，下面插播一条广告，我是《Flutter从0到1构建大前端应用》的作者，感谢已经购买的读者，此书属于入门上手的书籍，以简单明了的代码实例说明问题，也便于读者查阅相关内容。

![](https://img14.360buyimg.com/n1/jfs/t1/55763/28/4089/173115/5d1d7041E7d6bc656/d681b55e89bac6f6.jpg)

从Flutter基础开始讲解，结合实际案例，让读者逐步掌握Flutter的核心内容，实战项目篇又通过2个实战项目让读者除了掌握Flutter相关知识之外，对node、mongo，vue做了一些介绍，可以让更多的读者拥抱目前最火的大前端技术。

京东购买链接：[https://item.jd.com/12546599.html](https://item.jd.com/12546599.html)