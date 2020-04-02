import 'package:flutter/material.dart';
import 'package:flutter_gitee/page/widget/include_appbar.dart';
import 'package:flutter_gitee/page/widget/item_repo.dart';
import 'package:flutter_gitee/provider/favorites_model.dart';
import 'package:provider/provider.dart';

import '../../model/repo.dart';
import '../../service/api.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  var _futureList;
  @override
  void initState() {
    super.initState();
    _futureList = Api().getRepo();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IncludeAppBar(
        title: "Favorites",
        rightText: "SAVE",
      ),
      body: Container(
        child: Column(
          children: <Widget>[_buildSearch(), Expanded(child: _buildBody())],
        ),
      ),
    );
  }

  _buildBody() {
    return FutureBuilder<List<Repo>>(
        future: _futureList,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              print('waiting');
              return Center(child: Text("loading"));
            case ConnectionState.done:
              print('done');
              if (snapshot.hasError) {
                return Center(
                  child: Text('网络请求出错'),
                );
              } else if (snapshot.hasData) {
                return BuildListView(list: snapshot.data);
              } else {
                return Center(
                  child: Text('网络请求出错'),
                );
              }
          }
          return null;
        });
  }

  Container _buildSearch() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 15, right: 15),
      child: TextField(
        decoration: InputDecoration(
            icon: Icon(Icons.search),
            border: InputBorder.none,
            hintText: "Search Repositories"),
      ),
    );
  }
}

class BuildListView extends StatelessWidget {
  const BuildListView({
    Key key,
    @required List<Repo> list,
  })  : _list = list,
        super(key: key);

  final List<Repo> _list;

  @override
  Widget build(BuildContext context) {
    var list = Provider.of<FavoritesModel>(context).favoRepos(_list);

    return ListView.separated(
      itemCount: list.length,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(height: 2);
      },
      itemBuilder: (BuildContext context, int index) {
        var item = list[index];
        var lastItem = index < 1 ? null : list[index - 1];
        return _buildItem(context, item, lastItem);
      },
    );
  }

  Widget _buildItem(BuildContext context, Repo item, Repo lastItem) {
    Widget content = ItemRepo(
      item.humanName.replaceAll("/", " / "),
      item.owner.avatarUrl,
      rightIcon: item.isFavo == true
          ? Icons.remove_circle_outline
          : Icons.add_circle_outline,
      onTap: () {
        Provider.of<FavoritesModel>(context, listen: false).add(item);
      },
    );

    if (lastItem == null || item.isFavorite != lastItem.isFavorite) {
      return Column(
        children: <Widget>[
          Container(
            color: Color(0xffF0EFF4),
            height: 12,
          ),
          Container(
            height: 40,
            alignment: Alignment.bottomLeft,
            child: Container(
                margin: EdgeInsets.only(left: 15, top: 8, bottom: 8),
                child: Text(
                  item.isFavo == true ? "Selected" : "Select Repositories",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                )),
          ),
          Divider(height: 2),
          content
        ],
      );
    } else {
      return content;
    }
  }
}

class MyToolbar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar();
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
