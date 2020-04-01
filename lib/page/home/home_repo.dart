import 'package:flutter/material.dart';
import 'package:flutter_gitee/model/repo.dart';
import 'package:flutter_gitee/service/api.dart';
import 'package:infinite_listview/infinite_listview.dart';

class HomeRepo extends StatefulWidget {
  @override
  HomeRepoState createState() {
    return HomeRepoState();
  }
}

class HomeRepoState extends State<HomeRepo> {
  final InfiniteScrollController _infiniteController = InfiniteScrollController(
    initialScrollOffset: 0.0,
  );
  var _futureList;
  @override
  void initState() {
    super.initState();
    _futureList = Api().getRepo();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
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
              } else if(snapshot.hasData){
                return BuildListView(list: snapshot.data);
              }else{
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
    return ListView.separated(
        key: PageStorageKey(0),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return Material(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "detail",arguments: list[index]);
              },
              child: ListTile(
                title: Text(list[index].name),
                subtitle: Text(list[index].path),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(height: 2.0));
  }
}
