import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_gitee/config/config.dart';
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
    Future.delayed(Duration(seconds: 3), () {
      UserModel userModel = Provider.of<UserModel>(context,listen: false);
      if (userModel.isLogin) {
        Navigator.of(context).pushReplacementNamed("login");
      } else {
        Navigator.of(context).pushReplacementNamed("login");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Image.network(
              'http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/107/w1024h683/20181128/pKtl-hphsupx4744393.jpg')
          // Image.asset('images/loading.jpg',fit: BoxFit.fill,)
        ],
      ),
    );
  }
}
