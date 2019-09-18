import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  FixedExtentScrollController fixedExtentScrollController =
      new FixedExtentScrollController();

  final List<String> imgList = [
    'https://p0.meituan.net/deal/66516fcd8ae3975edd2f4b5f8a931ce925464.jpg.webp@180w_180h_1e_1c_1l_80q%7Cwatermark=0',
    'https://p1.meituan.net/deal/141205589b18b856b87543af52abc29e35813.jpg.webp@180w_180h_1e_1c_1l_80q%7Cwatermark=0',
    'https://p1.meituan.net/deal/bc4a2aa8ea099f18053ab1c3eac6b6ae409003.jpg.webp@180w_180h_1e_1c_1l_80q%7Cwatermark=0',
    'https://p0.meituan.net/deal/e4f7972d34b289a00ae2491c70359024128785.jpg.webp@180w_180h_1e_1c_1l_80q%7Cwatermark=0',
    'https://p1.meituan.net/deal/603250f870b1a380817b6e236f34d91e29643.jpg.webp@180w_180h_1e_1c_1l_80q%7Cwatermark=0',
    'https://p1.meituan.net/deal/dc61effc0eea3e9e7eb46ad6538406104138050.jpg.webp@180w_180h_1e_1c_1l_80q%7Cwatermark=0',
    'https://p1.meituan.net/deal/21cb8a9168c0cb1ef309f7b7a6127f3f29289.jpg.webp@180w_180h_1e_1c_1l_80q%7Cwatermark=0',
    'https://p1.meituan.net/deal/0edbee70060eb1db27b7db7853dedb8424600.jpg.webp@180w_180h_1e_1c_1l_80q%7Cwatermark=0',
    'https://p0.meituan.net/deal/0be8d6f4610dee0150b65f874192cabd47239.jpg.webp@180w_180h_1e_1c_1l_80q%7Cwatermark=0'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
//      body: ListView(
//        padding: const EdgeInsets.all(10.0),
//        itemExtent: 30.0,
//        children: <Widget>[
//          Text('A'),
//          Text('B'),
//          Text('C'),
//          Text('D'),
//          Text('E')
//        ],
//      ),
//      body: ListView.separated(
//        itemCount: 20,
//        itemBuilder: (BuildContext context, int index) {
//          return ListTile(title: Text("列表项$index"));
//        },
//        separatorBuilder: (BuildContext context, int index) {
//          return Align(
//            alignment: Alignment.centerLeft,
//            child: FlutterLogo(),
//          );
//        },
//      ),
      body: ListWheelScrollView(
        controller: fixedExtentScrollController,
        physics: ClampingScrollPhysics(),
        itemExtent: 150.0,
        children: imgList.map((img) {
          return Container(
              height: 150.0,
              child: Row(
                children: <Widget>[
                  Image.network(
                    img,
                    width: 150.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                  ),
                  Text(
                    '文字介绍',
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ));
        }).toList(),
      ),
    );
  }
}
