import 'package:flutter/material.dart';
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
      appBar: _buildAppBar(),
      body: Container(
        child: Column(
          children: <Widget>[_buildSearch(), _buildBody()],
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

  AppBar _buildAppBar() {
    return AppBar(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text("Favorites"),
      leading: InkWell(
        child: Icon(Icons.arrow_back),
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
      actions: <Widget>[
        InkWell(
          child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 15, left: 15),
              child: Text(
                "SAVE",
                style: TextStyle(fontSize: 16, color: Colors.blue),
              )),
          onTap: () {},
        )
      ],
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
      shrinkWrap: true,
      itemCount: list.length,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(height: 2);
      },
      itemBuilder: (BuildContext context, int index) {
        var item = list[index];
        var lastItem = index < 1 ? null : list[index - 1];
        return _buildItem(context, item,lastItem);
      },
    );
  }

  Widget _buildItem(BuildContext context, Repo item,Repo lastItem) {
    Widget content = InkWell(
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
          Icon(
            item.isFavo == true
                ? Icons.remove_circle_outline
                : Icons.add_circle_outline,
            color: Colors.grey,
          )
        ]),
      ),
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
                  item.isFavo == true ? "Selected" : "Select",
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
