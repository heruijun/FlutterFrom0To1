class User {
  String username;
  String password;

  User({this.username, this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      password: json['password']
    );
  }

  User.map(dynamic obj) {
    this.username = obj['username'];
    this.password = obj['password'];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["uaername"] = username;
    map["password"] = password;
    // print(map);
    return map;
  }
}