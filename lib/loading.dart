import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_gitee/config/config.dart';
import 'package:flutter_gitee/service/api.dart';
import 'package:provider/provider.dart';

import 'provider/user_model.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Config.init();
    Future.delayed(Duration(seconds: 1), () {
      UserModel userModel = Provider.of<UserModel>(context, listen: false);
      if (userModel.isLogin) {
        var token = userModel.token;
        Api.accessToken = token.accessToken;
        // if(DateTime.now().millisecondsSinceEpoch-token.createdAt>=token.expiresIn){

        // }
        Navigator.of(context).pushReplacementNamed("main_main");
      } else {
        Navigator.of(context).pushReplacementNamed("login");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/logo_gitee.png',
              ),
              SizedBox(height:10,),
              Text("Gitter",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              SizedBox(height:50),
              Text("A gitee app,powered by flutter,ui by github")
            ],
          )),
    );
  }
}
