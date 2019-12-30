import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  @override
  _TabBarWidgetState createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List tabs = ['动作', '科幻', '爱情', '喜剧', '恐怖', '悬疑', '直播', '体育', '动漫'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('电影分类'),
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return ListView.builder(
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(title: Text("$e$index"));
            },
          );
        }).toList(),
      ),
    );
  }
}
