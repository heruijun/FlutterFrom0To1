import 'package:flutter/material.dart';
import 'package:flutter_animations/progress_dialog.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<LoadingPage> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("加载动画"),
      ),
      body: ProgressDialog(
        isLoading: _loading,
        message: '正在加载...',
        alpha: 0.35,
        child: Center(
          child: RaisedButton(
            onPressed: () => _onRefresh(),
            child: Text('显示加载动画'),
          ),
        ),
      ),
    );
  }

  Future<Null> _onRefresh() async {
    setState(() {
      _loading = !_loading;
    });
    // 模拟耗时操作
    await Future.delayed(Duration(seconds: 5), () {
      setState(() {
        _loading = !_loading;
      });
    });
  }
}
