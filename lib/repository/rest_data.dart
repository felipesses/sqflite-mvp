import 'package:mvp_sqflite/models/user_model.dart';
import 'package:mvp_sqflite/utils/network_util.dart';

class RestData {
  NetworkUtil _networkUtil = NetworkUtil();

  static final BASE_URL = "";
  static final LOGIN_URL = BASE_URL + "/";

  Future<User> login(String username, String password) {
    return new Future.value(new User(username, password));
  }
}
