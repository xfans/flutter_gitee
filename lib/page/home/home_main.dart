import 'package:flutter/material.dart';
import 'package:flutter_gitreader/page/home/home_drawer.dart';
import 'package:flutter_gitreader/page/home/home_local.dart';
import 'package:flutter_gitreader/page/home/home_repo.dart';
import 'package:flutter_gitreader/page/home/home_start.dart';

class HomeMain extends StatefulWidget {
  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  Widget _body;
  void _handleChange(String name) {
    setState(() {
      switch (name) {
      case "Repo":
        _body = HomeRepo();
        break;
      case "Local":
        _body = HomeLocal();
        break;
      case "Start":
        _body = HomeStart();
        break;
      default:
    }
    });
    
  }

  var _title = "Git阅读器";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title)),
      body: _body,
      drawer: HomeDrawer(this._handleChange),
    );
  }
}
