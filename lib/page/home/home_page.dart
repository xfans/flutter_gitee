import 'package:flutter/material.dart';
import 'package:flutter_gitee/model/divider_item.dart';
import 'package:flutter_gitee/model/feature.dart';
import 'package:flutter_gitee/model/repo.dart';
import 'package:flutter_gitee/model/title_item.dart';
import 'package:flutter_gitee/page/widget/item_repo.dart';
import 'package:flutter_gitee/provider/favorites_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{
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
        onTap: () {
          if ("Repositories" == item.title) {
            Navigator.of(context).pushNamed("repositories_page");
          }
        },
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
      return ItemRepo(
          item.humanName.replaceAll("/", " / "), item.owner.avatarUrl,onTap: (){
            Navigator.pushNamed(context, "detail", arguments: item);
          },);
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

  @override
  bool get wantKeepAlive => true;
}
