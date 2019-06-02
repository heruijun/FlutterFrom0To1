import 'package:flutter_network/pages/models/user.dart';
import 'package:flutter_network/pages/utils/network_util.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RestData {

  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "http://172.20.10.3:3000";
  static final LOGIN_URL = BASE_URL + "/user/login";

  Future<User> login(String username, String password) async {

    final response = await http.post(LOGIN_URL);

    if (response.statusCode == 200) {
      return new Future.value(User.fromJson(json.decode(response.body)));
    } else {
      throw Exception('Failed to load post');
    }
  }

}