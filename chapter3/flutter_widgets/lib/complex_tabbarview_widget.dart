import 'package:flutter/material.dart';

class ComplexTabBarViewWidget extends StatefulWidget {
  @override
  _ComplexTabBarViewWidgetState createState() =>
      _ComplexTabBarViewWidgetState();
}

class _ComplexTabBarViewWidgetState extends State<ComplexTabBarViewWidget>
    with SingleTickerProviderStateMixin {
  List<String> _tabs = const <String>[
    '动作',
    '科幻',
    '爱情',
    '喜剧',
    '恐怖',
    '悬疑',
    '直播',
    '体育',
    '动漫'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: _tabs.length,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: SliverAppBar(
                  title: const Text('电影分类'),
                  pinned: true,
                  expandedHeight: 300.0,
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(
                    isScrollable: true,
                    tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            // These are the contents of the tab views, below the tabs.
            children: _tabs.map((String name) {
              return SafeArea(
                top: false,
                bottom: false,
                child: Builder(
                  builder: (BuildContext context) {
                    return CustomScrollView(
                      key: PageStorageKey<String>(name),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                        ),
                        SliverFixedExtentList(
                          itemExtent: 48.0,
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return ListTile(
                                  title: Text('$name $index',
                                      style: TextStyle(fontSize: 20)));
                            },
                            childCount: 30,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
