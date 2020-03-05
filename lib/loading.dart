import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_gitreader/config/config.dart';

class LoadingPage extends StatefulWidget{
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>{
  
  @override
  void initState() {
    super.initState();
    Config.init();
    Future.delayed(Duration(seconds:3),(){
      Navigator.of(context).pushReplacementNamed("login");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Image.network('http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/107/w1024h683/20181128/pKtl-hphsupx4744393.jpg')
          // Image.asset('images/loading.jpg',fit: BoxFit.fill,)
        ],
      ),);
  }

}