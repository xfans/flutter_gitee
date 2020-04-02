import 'package:flutter/material.dart';
import 'package:flutter_gitee/model/divider_item.dart';
import 'package:flutter_gitee/model/feature.dart';
import 'package:flutter_gitee/model/repo.dart';
import 'package:flutter_gitee/model/title_item.dart';
import 'package:flutter_gitee/provider/favorites_model.dart';
import 'package:provider/provider.dart';

class HomeMain extends StatefulWidget {
  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  List<Object> _list;

  @override
  void initState() {
    _list = List();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _list.clear();
    _list.addAll(Provider.of<FavoritesModel>(context).homeRepos);
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
            InkWell(
              child: Container(
                  margin: EdgeInsets.only(right: 15, top: 8, bottom: 8),
                  child: Text(
                    item.rightText,
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  )),
              onTap: () {
                Navigator.of(context).pushNamed("favorites");
              },
            )
          ],
        ),
      );
    } else if (item is Repo) {
      return InkWell(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          height: 50,
          child: Row(children: <Widget>[
            Image.network(
              item.owner.avatarUrl,
              fit: BoxFit.contain,
              height: 30,
              width: 30,
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Text(item.humanName.replaceAll("/", " / "),
                  style: TextStyle(fontSize: 16)),
            ),
            
          ]),
        ),
        onTap: () {
        },
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
