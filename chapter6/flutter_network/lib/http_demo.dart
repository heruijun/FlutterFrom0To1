import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Movie> fetchPost() async {
  final response = await http.get('http://172.20.10.3:3000/movies/detail/1');

  if (response.statusCode == 200) {
    return Movie.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}

class Movie {
  final String title;

  Movie({this.title});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(title: json['title']);
  }
}

class HttpDemo extends StatefulWidget {
  @override
  _HttpDemoState createState() => new _HttpDemoState(movie: fetchPost());
}

class _HttpDemoState extends State<HttpDemo> {
  final Future<Movie> movie;

  _HttpDemoState({Key key, this.movie});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Center(
            child: FutureBuilder<Movie>(
      future: movie,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data.title);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        // By default, show a loading spinner
        return CircularProgressIndicator();
      },
    )));
  }
}
