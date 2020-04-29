import 'package:flutter/material.dart';
import 'package:mvp_sqflite/models/user_model.dart';
import 'package:mvp_sqflite/pages/login/login_presenter.dart';
import 'package:mvp_sqflite/repository/database.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginPageContract {
  LoginPresenter _presenter;
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String _username, _password;

  _LoginPageState() {
    _presenter = new LoginPresenter(this);
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() {
        isLoading = true;
        form.save();
        _presenter.login(_username, _password);
      });
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  @override
  void onLoginError(String error) {
    _showSnackBar(error);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void onLoginSuccess(User user) async {
    _showSnackBar(user.toString());
    setState(() {
      isLoading = false;
    });
    var db = new DatabaseHelper();
    await db.saveUser(user);
    Navigator.of(context).pushNamed("/home");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                onSaved: (val) => _username = val,
                decoration: new InputDecoration(labelText: "Username"),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new TextFormField(
                onSaved: (val) => _password = val,
                decoration: new InputDecoration(labelText: "Password"),
              ),
            ),
            RaisedButton(
              onPressed: _submit,
              child: new Text("Login"),
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
