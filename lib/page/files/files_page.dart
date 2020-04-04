import 'package:flutter/material.dart';
import 'package:flutter_gitee/model/files.dart';
import 'package:flutter_gitee/model/repo.dart';
import 'package:flutter_gitee/page/widget/include_appbar.dart';
import 'package:flutter_gitee/service/api.dart';

class FilesPage extends StatefulWidget {
  @override
  _FilesPageState createState() => _FilesPageState();
}

class _FilesPageState extends State<FilesPage> {
  var _futureFiles;
  Repo repo;
  String path = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    repo = ModalRoute.of(context).settings.arguments;
    _futureFiles = Api().getRepoFils(repo.namespace.name, repo.name, path);
    return Scaffold(
        appBar: IncludeAppBar(
          title: "Files",
          rightIcon: Icons.share,
          onRightTap: () {},
        ),
        body: WillPopScope(child: _buildBody(), onWillPop: _willPop));
  }

  _buildBody() {
    return FutureBuilder<List<Files>>(
        future: _futureFiles,
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
                return BuildListView(
                  list: snapshot.data,
                  onTap: (Files file) {
                    if (file.type == "dir") {
                      setState(() {
                        path = file.path;
                      });
                    } else {
                      Navigator.of(context)
                          .pushNamed("text_page", arguments: file);
                    }
                  },
                );
              } else {
                return Center(
                  child: Text('网络请求出错'),
                );
              }
          }
          return null;
        });
  }

  Future<bool> _willPop() {
    if (path.contains("/")) {
      setState(() {
        print("path:" + path);
        path = path.substring(0, path.lastIndexOf("/"));
        print("path:" + path);
      });
    } else {
      if (path != "") {
        setState(() {
          path = "";
        });
      } else {
        Navigator.of(context).pop();
      }
    }
    return Future.value(false);
  }
}

class BuildListView extends StatelessWidget {
  BuildListView({this.list, this.onTap});

  List<Files> list;
  final ValueChanged<Files> onTap;
  void _handleTap(Files file) {
    onTap(file);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        var item = list[index];
        return _buildItem(context, item);
      },
    );
  }

  Widget _buildItem(BuildContext context, Files item) {
    return InkWell(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 15, right: 15),
        height: 50,
        child: Row(children: <Widget>[
          Icon(
            item.type == "dir" ? Icons.folder : Icons.insert_drive_file,
            size: 20,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(item.name, style: TextStyle(fontSize: 16)),
          ),
        ]),
      ),
      onTap: () {
        _handleTap(item);
      },
    );
  }
}
