import 'package:flutter/material.dart';
import 'package:flutter_animations/spin_kit_ripple.dart';

class ProgressDialog extends StatelessWidget {
  //子布局
  final Widget child;

  //加载中是否显示
  final bool isLoading;

  //进度提醒内容
  final String message;

  //加载中动画
  final Widget progress;

  // 加载框背景透明度
  final double alpha;

  // 字体颜色
  final Color textColor;

  ProgressDialog(
      {Key key,
      @required this.isLoading,
      this.message,
      this.progress = const SpinKitRipple(color: Colors.white, size: 60.0),
      this.alpha = 0.5,
      this.textColor = Colors.white,
      @required this.child})
      : assert(child != null),
        assert(isLoading != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(child);
    if (isLoading) {
      Widget layoutProgress;
      if (message == null) {
        layoutProgress = Center(
          child: progress,
        );
      } else {
        layoutProgress = Center(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                progress,
                Container(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                  child: Text(
                    message,
                    style: TextStyle(color: textColor, fontSize: 16.0),
                  ),
                )
              ],
            ),
          ),
        );
      }
      widgetList.add(Opacity(
        opacity: alpha,
        child: new ModalBarrier(color: Colors.black87),
      ));
      widgetList.add(layoutProgress);
    }
    return Stack(
      children: widgetList,
    );
  }
}
