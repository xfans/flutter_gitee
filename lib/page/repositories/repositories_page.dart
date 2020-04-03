import 'package:flutter/material.dart';
import 'package:flutter_gitee/model/repo.dart';
import 'package:flutter_gitee/page/widget/include_appbar.dart';
import 'package:flutter_gitee/page/widget/item_repo.dart';
import 'package:flutter_gitee/service/api.dart';

class RepositoriesPage extends StatefulWidget {
  @override
  RepositoriesPageState createState() {
    return RepositoriesPageState();
  }
}

class RepositoriesPageState extends State<RepositoriesPage> {
  var _futureList;
  @override
  void initState() {
    super.initState();
    _futureList = Api().getRepo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IncludeAppBar(
        title: "Repositories",
      ),
      body: _buildBody(),
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
}

class BuildListView extends StatelessWidget {
  const BuildListView({
    Key key,
    @required this.list,
  }) : super(key: key);

  final List<Repo> list;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemRepo(
            list[index].name,
            list[index].owner.avatarUrl,
            onTap: () {
              Navigator.pushNamed(context, "detail", arguments: list[index]);
            },
          );
        },
      ),
    );
  }
}
