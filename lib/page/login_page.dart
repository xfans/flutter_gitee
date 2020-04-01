import 'package:flutter/material.dart';
import 'package:flutter_gitreader/provider/user_model.dart';
import 'package:flutter_gitreader/service/api.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    _getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.blue),
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "登录",
                  style: TextStyle(fontSize: 15),
                ),
                TextField(
                  decoration: InputDecoration(labelText: "邮箱"),
                ),
                TextField(
                  decoration: InputDecoration(labelText: "密码"),
                ),
                MaterialButton(
                    minWidth: 200,
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text("登录"),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed("main_main");
                    }),
                MaterialButton(
                    minWidth: 200,
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text("浏览器登录"),
                    onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _getUser() async {
    var user = await Api().getUser();
    if (user != null) {
      UserModel userModel = Provider.of<UserModel>(context, listen: false);
      userModel.user = user;
    }
  }
}
