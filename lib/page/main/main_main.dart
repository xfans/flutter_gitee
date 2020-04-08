import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gitee/page/home/home_page.dart';
import 'package:flutter_gitee/page/news/news_page.dart';
import 'package:flutter_gitee/page/search/search_page.dart';
import 'main_navigation.dart';

class MainMain extends StatefulWidget {
  @override
  _MainMainState createState() => _MainMainState();
}

class _MainMainState extends State<MainMain> {
  Widget _actionButton;
  bool showSearch = false;
  var _title = "Home";
  final _bodyList = [HomePage(), NewsPage(), SearchPage()];
  final _pageController = PageController();

  void _handleChange(int index) {
    _pageController.jumpToPage(index);
    setState(() {
      switch (index) {
        case 0:
          _title = "Home";
          _actionButton = _buildHomeIconButton();
          break;
        case 1:
          _title = "News";
          _actionButton = _buildNavigationIconButton();
          break;
        case 2:
          _title = "Search";
          _actionButton = _buildSearchIconButton();
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: PageView(
          controller: _pageController,
          children: _bodyList,
          physics: NeverScrollableScrollPhysics(), // 禁止滑动
        ),
        bottomNavigationBar: MainNavigation(this._handleChange));
  }

  AppBar _buildAppBar() {
    return AppBar(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      elevation: 0,
      title: showSearch
          ? TextField(
              onSubmitted: _textChange,
            )
          : Text(_title),
      leading: UnconstrainedBox(
        child: Container(
          margin: EdgeInsets.only(left: 15),
          child: SizedBox(
            width: 40,
            height: 40,
            child: GestureDetector(
              child: ClipOval(
                child: Image.asset(
                  'images/logo_gitter.png',
                  fit: BoxFit.contain,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed("user_page");
              },
            ),
          ),
        ),
      ),
      actions: <Widget>[
        _actionButton == null ? _buildHomeIconButton() : _actionButton
      ],
    );
  }

  IconButton _buildHomeIconButton() {
    return IconButton(
        icon: Icon(
          Icons.add_circle_outline,
          color: Colors.transparent,
        ),
        onPressed: () {});
  }

  IconButton _buildNavigationIconButton() {
    return IconButton(
        icon: Icon(
          Icons.filter_list,
          color: Colors.transparent,
        ),
        onPressed: () {});
  }

  IconButton _buildSearchIconButton() {
    return IconButton(
        icon: Icon(
          Icons.search,
          color: Colors.grey,
        ),
        onPressed: () {
          setState(() {
            showSearch = !showSearch;
          });
        });
  }

  void _textChange(String value) {
    SearchPage search = _bodyList[2];
    search.setText(value);
    setState(() {
      showSearch = !showSearch;
    });
  }
}
