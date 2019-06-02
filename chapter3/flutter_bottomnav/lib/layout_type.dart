import 'package:flutter/foundation.dart';

abstract class HasLayoutGroup {
  VoidCallback get onLayoutToggle;
}

enum LayoutType {
  home,
  favorite,
  chat,
  help,
}

String layoutName(LayoutType layoutType) {
  switch (layoutType) {
    case LayoutType.home:
      return '首页';
    case LayoutType.favorite:
      return '收藏';
    case LayoutType.chat:
      return '聊天';
    case LayoutType.help:
      return '帮助';
    default:
      return '';
  }
}