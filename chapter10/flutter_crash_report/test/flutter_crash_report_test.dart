//import 'package:flutter/services.dart';
//import 'package:flutter_test/flutter_test.dart';
//import 'package:flutter_crash_report/flutter_crash_report.dart';
//
//void main() {
//  const MethodChannel channel = MethodChannel('flutter_crash_report');
//
//  setUp(() {
//    channel.setMockMethodCallHandler((MethodCall methodCall) async {
//      return '42';
//    });
//  });
//
//  tearDown(() {
//    channel.setMockMethodCallHandler(null);
//  });
//
//  test('getPlatformVersion', () async {
//    expect(await FlutterCrashReport.platformVersion, '42');
//  });
//}
