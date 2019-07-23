import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_creditcard/creditcard.dart';
import 'package:flutter_other/other_module.dart';
import 'package:flutter_base/loader/service_loader.dart';
import 'package:flutter_base/BankService/service/bank_service.dart';

/**
 * 主模块
 * 存放公共信息，比如登陆信息
 */
void main() {
  ServiceLoader.load();

//  BankService.MessageToNative("是时候学Flutter了",(Exception e){
//    return false;
//  }).then((bool value){
//    if(value){
//      print("从flutter发送消息到native成功");
//    }else{
//      print("从flutter发送消息到native失败");
//    }
//  });
//
  BankService.service().addEventListner("test", (String event,Map<dynamic,dynamic> params){
    print("从Native获取到广播事件 $event $params");
  });
//
//  print("发送广播到native");
//  BankService.service().emitEvent("test", {});

  runApp(
      _widgetForRoute(window.defaultRouteName)
  );
}

Widget _widgetForRoute(String route) {
  switch (route) {
    case 'creditcard':
      return CreditcardModule();
    case 'other':
      return OtherModule();
    default:
      return Center(
        child: Text('未找到模块: $route', textDirection: TextDirection.ltr),
      );
  }
}