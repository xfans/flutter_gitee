import 'package:flutter/material.dart';
import 'package:flutter_gitreader/model/user.dart';
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
    return Container(
      child: Text("login"),
    );
  }

  void _getUser() async{
    var user = await Api().getUser();
    if(user != null){
      UserModel userModel = Provider.of<UserModel>(context,listen: false);
      userModel.user = user;
    }
  }
}
