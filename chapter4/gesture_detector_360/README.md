# Flutter:使用手势识别做一个360旋转展物

最近在复习Flutter的GestureDetector相关知识时，想到了以前用Android实现的展物项目，这次完整的用Flutter实现了一下，真是感觉代码简洁了很多，

## 项目整体需求
1. 进入app时展物自动顺时针旋转
2. 触摸展物时停止旋转
3. 手势在展物上左右触摸滑动时展物跟随旋转
4. 离开触摸时记录触摸方向然后继续自动旋转
5. 可以顺时针，也可以逆时针旋转

## 旋转的原理
首先我们了解一下怎么让展物旋转起来，展物是一件在博物馆展示的文物，一共拍摄了72张，角度每5度进行一次拍摄，所以总体算起来就是72乘以5，一共就是360度正好是一圈，那么写到代码里面就是从第1张图开始计算，然后每90毫秒替换一张，不断累加到第72张，然后再从第一张开始，这样就正好转了一圈。
理解了实现思路之后，那么，转换成Flutter代码如下：
先设定第一张图片，
```
Image.asset(
    'images/product00${index}.png',
    fit: BoxFit.cover,
    width: width,
    height: height,
),
```

然后，我们通过Timer每100秒替换一下index改变图片的值，代码如下：
```
Timer.periodic(new Duration(milliseconds: 90), (timer) {
    setState(() {});
    if (index < count) {
      index++;
      return;
    }
    // 重新回到第一张图
    index = 1;
});
```
记得Timer在用完之后需要cancel掉，大家对state应该有所了解，这里就是通过修改
index的值得替换图片的。

但是这样会有一个问题，就是图片替换太快，而每张图片大小在40K左右，替换过程中会有白屏闪烁的问题，这是因为图片需要载入到内存中然后通过Image.asset展示出来，幸好，有一个属性可以解决这样的问题，把gaplessPlayback设置为true即可， 修改后代码如下：
```
Image.asset(
    'images/product00${index}.png',
    fit: BoxFit.cover,
    width: width,
    height: height,
    // 该属性防止图片快速切换时白屏发生，在新图出现前保持旧的图
    gaplessPlayback: true,
    excludeFromSemantics: true,
),
```

gaplessPlayback设置为true就能确保在新图出现之前呈现的还是旧图，这样就不会出现白屏闪烁问题。

## GestureDetector基本使用
接下来就是如何与手势结合起来了，通过一个例子，我们先来了解一下GestureDetector的基本用法，代码如下：
```
import 'package:flutter/material.dart';

class GestureDetectorPage extends StatefulWidget {
  @override
  _GestureDetectorState createState() => new _GestureDetectorState();
}

class _GestureDetectorState extends State<GestureDetectorPage> {
  String _opName = "未检测到操作";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GestureDetector手势识别"),
      ),
      body: Center(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 240.0,
            height: 120.0,
            child: Text(
              _opName,
              style: TextStyle(color: Colors.white),
            ),
          ),
          onTap: () => _showEventText("Tap"),
          onTapUp: (e) => _showEventText("TapUp"),
          onTapDown: (e) => _showEventText("TapDown"),
          onTapCancel: () => _showEventText("TapCancel"),
          onDoubleTap: () => _showEventText("DoubleTap"),
          onLongPress: () => _showEventText("LongPress"),
          onVerticalDragDown: (e) => _showEventText("onVerticalDragDown"),
          onVerticalDragStart: (e) => _showEventText("onVerticalDragStart"),
          onVerticalDragUpdate: (e) => _showEventText("onVerticalDragUpdate"),
          onVerticalDragEnd: (e) => _showEventText("onVerticalDragEnd"),
          onVerticalDragCancel: () => _showEventText("onVerticalDragCancel"),
          onHorizontalDragDown: (e) => _showEventText("onHorizontalDragDown"),
          onHorizontalDragStart: (e) => _showEventText("onHorizontalDragStart"),
          onHorizontalDragUpdate: (e) => _showEventText("onHorizontalDragUpdate"),
          onHorizontalDragEnd: (e) => _showEventText("onHorizontalDragEnd"),
          onHorizontalDragCancel: () => _showEventText("onHorizontalDragCancel"),
//          onPanDown: (e) => _showEventText("onPanDown"),
//          onPanStart: (e) => _showEventText("onPanStart"),
//          onPanUpdate: (e) => _showEventText("onPanUpdate"),
//          onPanEnd: (e) => _showEventText("onPanEnd"),
//          onScaleStart: (e) => _showEventText("onScaleStart"),
//          onScaleUpdate: (e) => _showEventText("onScaleUpdate"),
//          onScaleEnd: (e) => _showEventText("onScaleEnd"),
        ),
      ),
    );
  }

  void _showEventText(String text) {
    setState(() {
      _opName = text;
    });
    print(_opName);
  }
}
```

通过这个例子，我们可以在屏幕上的Text区域记录并显示出经过GestureDetector手势事件，以便帮助我们理解。

在本例中，我们需要用到的就是onTap，onPanStart，onPanUpdate，onPanEnd这几个回调方法，经过实践并对代码加入手势事件之后，代码如下：
```
GestureDetector(
  onTap: () => _cancelTimer(),
  onPanStart: (e) => _cancelTimer(),
  onPanUpdate: (e) => _onTouchImage(e),
  // 在触屏结束之后，恢复自动旋转
  onPanEnd: (e) => _startTimer(),
  child: Image.asset(
    'images/product00${index}.png',
    fit: BoxFit.cover,
    width: width,
    height: height,
    // 该属性防止图片快速切换时白屏发生，在新图出前时保持旧的图
    gaplessPlayback: true,
    excludeFromSemantics: true,
  ),
)
```

其中onTap，onPanStart，onPanEnd这几个很好理解，主要是onPanUpdate，里面调用了一个自己实现的_onTouchImage(e)方法，代码如下：
```
void _onTouchImage(e) {
    setState(() {
      index -= e.delta.dx.toInt();
    });
    // 防止取到不存在的图片报错
    if (index < 1) index = 1;
    if (index > count) index = count;
}
```

上面的代码中，在触摸屏幕的同时转换成index值替换图片，这样就实现了图片替换跟随手势的功能，然后，在手指离开屏幕之后还能继续旋转，这时候我们可以在触摸时加入方向判断，
```
if (e.delta.dx < 0) {
  // 顺时针
  direction = DIRECTION_CLOCKWISE;
}
if (e.delta.dx > 0) {
  // 逆时针
  direction = DIRECTION_ANTICLOCKWISE;
}
```

这样，一个简单的360展物就实现了，你可以在屏幕上任意触摸控制展物，很神奇吧！看一下最终效果：

![](https://raw.githubusercontent.com/heruijun/chahu/master/wu.gif)

github地址：[https://github.com/heruijun/flutter_360](https://github.com/heruijun/flutter_360)

## 新书推荐
《Flutter从0到1构建大前端应用》

![](https://img14.360buyimg.com/n1/jfs/t1/55763/28/4089/173115/5d1d7041E7d6bc656/d681b55e89bac6f6.jpg)

从Flutter基础开始讲解，结合实际案例，让读者逐步掌握Flutter的核心内容，实战项目篇又通过2个实战项目让读者除了掌握Flutter相关知识之外，对node、mongo，vue做了一些介绍，可以让更多的读者拥抱目前最火的大前端技术。

京东购买链接：[点击购买](https://item.jd.com/12546599.html)