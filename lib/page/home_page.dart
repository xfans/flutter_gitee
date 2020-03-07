import 'package:flutter/material.dart';
import 'package:flutter_gitreader/model/repo.dart';
import 'package:flutter_gitreader/provider/repos_model.dart';
import 'package:flutter_gitreader/service/api.dart';
import 'package:infinite_listview/infinite_listview.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final InfiniteScrollController _infiniteController = InfiniteScrollController(
    initialScrollOffset: 0.0,
  );
  List<Repo> list = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      _retrieveData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Git阅读器")),
      body: _buildBody(),
    );
  }

  _retrieveData() async {
    list = await Api().getRepo();
    Provider.of<ReposModel>(context,listen: false).repos = list;
  }

  _buildBody() {
    return Consumer<ReposModel>(
      builder: (BuildContext context, ReposModel value, Widget child) {
        return ListView.separated(
            key: PageStorageKey(0),
            itemCount: value.repos.length,
            itemBuilder: (BuildContext context, int index) {
              return Material(
                child: InkWell(
                  onTap: () {},
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
      },
    );
  }
}
