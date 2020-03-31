import 'package:flutter/material.dart';
import 'package:flutter_gitreader/page/home/home_drawer.dart';
import 'package:flutter_gitreader/page/home/home_local.dart';
import 'package:flutter_gitreader/page/home/home_repo.dart';
import 'package:flutter_gitreader/page/home/home_start.dart';

import 'home_navigation.dart';

class HomeMain extends StatefulWidget {
  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  Widget _body;
  var _title = "Home";
  void _handleChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _title = "Home";
          _body = HomeRepo();
          break;
        case 1:
        _title = "Inbox";
          _body = HomeLocal();
          break;
        case 2:
        _title = "Search";
          _body = HomeStart();
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        leading: Container(
            margin: const EdgeInsets.only(left: 15),
            child: Image.asset(
              'images/logo_gitee.png',
              fit: BoxFit.contain,
            )),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.add_circle_outline,
                color: Colors.blue,
              ),
              onPressed: () {})
        ],
      ),
      body: _body,
      bottomNavigationBar: HomeNavigation(this._handleChange),
    );
  }
}
