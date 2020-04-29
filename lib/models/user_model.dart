class User {
  String username;
  String password;

  User(this.username, this.password);

  User.map(dynamic obj) {
    this.username = obj['username'];
    this.password = obj['password'];
  }

  String get userName => username;
  String get userPass => password;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['username'] = username;
    map['password'] = password;
    return map;
  }
}
