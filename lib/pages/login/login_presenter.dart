import 'package:mvp_sqflite/models/user_model.dart';
import 'package:mvp_sqflite/repository/rest_data.dart';

abstract class LoginPageContract {
  void onLoginSuccess(User user);
  void onLoginError(String error);
}

class LoginPresenter {
  LoginPageContract contract;
  RestData api = new RestData();
  LoginPresenter(this.contract);

  login(String username, String password) async {
    api.login(username, password).then((User user) {
      return contract.onLoginSuccess(user);
    }).catchError((e) {
      return contract.onLoginError(e);
    });
  }
}
