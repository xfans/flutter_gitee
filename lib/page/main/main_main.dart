import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gitee/page/home/home_main.dart';
import 'package:flutter_gitee/page/home/home_start.dart';
import 'main_navigation.dart';

class MainMain extends StatefulWidget {
  @override
  _MainMainState createState() => _MainMainState();
}

class _MainMainState extends State<MainMain> {
  Widget _body;
  Widget _actionButton;
  var _title = "Home";
  void _handleChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _title = "Home";
          _actionButton = _buildHomeIconButton();
          _body = HomeMain();
          break;
        case 1:
          _title = "Inbox";
          _actionButton = _buildNavigationIconButton();
          _body = HomeStart();
          break;
        case 2:
          _title = "Search";
          _actionButton = _buildSearchIconButton();
          _body = HomeStart();
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _body == null ? HomeMain() : _body,
      bottomNavigationBar: MainNavigation(this._handleChange),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(_title),
      leading: Container(
          margin: const EdgeInsets.only(left: 15),
          child: Image.asset(
            'images/logo_gitee.png',
            fit: BoxFit.contain,
          )),
      actions: <Widget>[
        _actionButton == null ? _buildHomeIconButton() : _actionButton
      ],
    );
  }

  IconButton _buildHomeIconButton() {
    return IconButton(
        icon: Icon(
          Icons.add_circle_outline,
          color: Colors.blue,
        ),
        onPressed: () {});
  }

  IconButton _buildNavigationIconButton() {
    return IconButton(
        icon: Icon(
          Icons.filter_list,
          color: Colors.blue,
        ),
        onPressed: () {});
  }

  IconButton _buildSearchIconButton() {
    return IconButton(
        icon: Icon(
          Icons.search,
          color: Colors.grey,
        ),
        onPressed: () {});
  }

  // void _getUser() async {
  //   var user = await Api().getUser();
  //   if (user != null) {
  //     UserModel userModel = Provider.of<UserModel>(context, listen: false);
  //     userModel.user = user;
  //   }
  // }
}
