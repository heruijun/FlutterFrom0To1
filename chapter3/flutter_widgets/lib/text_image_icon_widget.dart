import 'package:flutter/material.dart';

class TextImageIconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container"),
      ),
      body: Column(
        children: <Widget>[
          // 加载本地图片，AssetImage也能写成Image.asset
          Image(image: AssetImage("images/image_icon.png"), width: 50.0),
          // 网络方式加载图片，NetworkImage也能写成Image.nerwork
          Image(
            image: NetworkImage(
                "https://www.phei.com.cn/templates/images/img_logo.jpg"),
            width: 120.0,
          )
        ],
      ),
    );
  }
}
