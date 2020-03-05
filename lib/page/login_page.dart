import 'package:flutter/material.dart';
import 'package:flutter_gitreader/service/api.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    Api().getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("login"),
    );
  }
}
