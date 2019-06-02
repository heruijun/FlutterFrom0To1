import 'package:flutter/material.dart';
import 'package:flutter_store/filepath_provider.dart';
import 'package:flutter_store/share_preferences.dart';
import 'package:flutter_store/sqflite_checkin.dart';
import 'package:flutter_store/store_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '持久化',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/SharedPreferences': (context) =>
            SharedPreferencesPage(title: 'Shared Preferences Demo'),
        '/CheckInPage': (context) => CheckInPage(title: '用户打卡'),
        '/FileProvider': (context) => FileProviderPage(
              title: '文件存储',
              storage: InfoStorage(),
            ),
      },
      home: StorePage(title: '持久化'),
    );
  }
}
