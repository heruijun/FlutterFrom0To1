import "package:dio/dio.dart";
import 'dart:async';
import 'package:flutter_boss/common/config/config.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();
  Dio _client;

  factory HttpUtil() => _instance;

  HttpUtil._internal() {
    if (null == _client) {
      BaseOptions options = new BaseOptions(
        baseUrl: "${Config.BASE_URL}",
        connectTimeout: 1000 * 10,
        receiveTimeout: 3000,
      );
      _client = new Dio(options);
    }
  }

  Future<Response<Map<String, dynamic>>> get(String path, [Map<String, dynamic> params]) async {
    Response<Map<String, dynamic>> response;
    if (null != params) {
      response = await _client.get(path, queryParameters: params);
    } else {
      response = await _client.get(path);
    }
    return response;
  }
}