import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gitee/model/repo.dart';
import 'package:flutter_gitee/page/widget/item_repo.dart';
import 'package:flutter_gitee/page/widget/load_content.dart';
import 'package:flutter_gitee/service/api.dart';

class SearchPage extends StatefulWidget {
  SearchPageState _state;
  setText(String text) {
    _state.setText(text);
  }

  @override
  SearchPageState createState() {
    _state = SearchPageState();
    return _state;
  }
}

class SearchPageState extends State<SearchPage> {
  var _futureList;
  var _text;
  var _oldText;
  setText(String text) {
    setState(() {
      _text = text;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_oldText != _text && _text != "") {
      _futureList = Api().getSearchRepo(_text);
      _oldText = _text;
    }
    return LoadContent<List<Repo>>(
        future: _futureList,
        contentBuilder: (data) {
          return BuildListView(list: data);
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
          return InkWell(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(children: <Widget>[
                    Image.network(
                      list[index].owner.avatarUrl,
                      fit: BoxFit.contain,
                      height: 15,
                      width: 15,
                    ),
                    SizedBox(width: 5),
                    Text(list[index].owner.name)
                  ]),
                  SizedBox(height: 8),
                  Text(
                    list[index].name,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 6),
                  Text(list[index].description != null
                      ? list[index].description
                      : ""),
                  SizedBox(height: 8),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(children: <Widget>[
                          Text(
                            "●",
                            style: TextStyle(
                                color: Random().nextBool()
                                    ? Colors.yellow
                                    : Colors.blue,
                                fontSize: 12),
                          ),
                          SizedBox(width: 8),
                          Text(list[index].language != null
                              ? list[index].language
                              : ""),
                        ]),
                        Row(children: <Widget>[
                          Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.yellow,
                          ),
                          SizedBox(width: 8),
                          Text("${list[index].stargazersCount}"),
                        ])
                      ])
                ],
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, "detail", arguments: list[index]);
            },
          );
          // return ItemRepo(
          //   list[index].name,
          //   list[index].owner.avatarUrl,
          //   onTap: () {
          //     Navigator.pushNamed(context, "detail", arguments: list[index]);
          //   },
          // );
        },
      ),
    );
  }
}
