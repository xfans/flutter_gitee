import 'package:flutter/material.dart';
import 'package:flutter_gitreader/model/divider_item.dart';
import 'package:flutter_gitreader/model/feature.dart';
import 'package:flutter_gitreader/model/title_item.dart';

class HomeMain extends StatefulWidget {
  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  List<Object> _list;

  @override
  void initState() {
    _list = List();
    _list.add(TitleItem("My Work", "", ""));
    _list.add(Feature("images/home_issues.png", "Issues", ""));
    _list.add(Feature("images/home_pr.png", "Pull Requests", ""));
    _list.add(Feature("images/home_repo.png", "Repositories", ""));
    _list.add(Feature("images/home_org.png", "Organizations", ""));
    _list.add(DividerItem());
    _list.add(TitleItem("Favorites", "EDIT", ""));
    _list.add(TitleItem("Favorites", "EDIT", ""));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: _list.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildItem(_list[index]);
        },
      ),
    );
  }

  Widget _buildItem(Object item) {
    if (item is Feature) {
      return ListTile(
        leading: Container(
          child: Image.asset(
            item.icon,
            height: 40,
            width: 40,
          ),
        ),
        title: Text(item.title, style: TextStyle(fontSize: 16)),
        onTap: () {},
      );
    } else if (item is TitleItem) {
      return Container(
        margin: EdgeInsets.only(top: 8, bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(left: 15, top: 8, bottom: 8),
                child: Text(
                  item.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            GestureDetector(
              child: Container(
                  margin: EdgeInsets.only(right: 15, top: 8, bottom: 8),
                  child: Text(
                    item.rightText,
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  )),
              onTap: () {},
            )
          ],
        ),
      );
    } else if (item is DividerItem) {
      return Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        child: Divider(
          height: item.height,
        ),
      );
    } else {
      return Divider(
        height: 2.0,
      );
    }
  }
}
