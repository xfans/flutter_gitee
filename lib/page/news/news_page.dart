import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gitee/model/news.dart';
import 'package:flutter_gitee/page/widget/load_content.dart';
import 'package:flutter_gitee/provider/user_model.dart';
import 'package:flutter_gitee/service/api.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatefulWidget {
  @override
  NewsPageState createState() {
    return NewsPageState();
  }
}

class NewsPageState extends State<NewsPage> with AutomaticKeepAliveClientMixin {
  var _futureList;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _futureList =
        Api().getNews(Provider.of<UserModel>(context, listen: false).user.name);
  }

  @override
  Widget build(BuildContext context) {
    return LoadContent<List<News>>(
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

  final List<News> list;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          var news = list[index];
          return InkWell(
            child: Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(children: <Widget>[
                    Image.network(
                      news.actor.avatarUrl,
                      fit: BoxFit.contain,
                      height: 30,
                      width: 30,
                    ),
                    SizedBox(width: 8),
                    Text(
                      news.actor.name,
                      style: TextStyle(fontSize: 16),
                    )
                  ]),
                  SizedBox(height: 8),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 38),
                      _getEvent(news.type),
                      Text(
                        news.repo.fullName,
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                      Text(
                        _getEventDesc(news.type),
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  // SizedBox(height: 6),
                  Container(
                    child: news.type == "ProjectCommentEvent"
                        ? Padding(
                            padding: const EdgeInsets.only(top: 5, left: 38),
                            child: Text(_getComment(news)),
                          )
                        : Container(),
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, "detail", arguments: news.repo);
            },
          );
        },
      ),
    );
  }

  Widget _getEvent(String type) {
    var _text;
    IconData _icon;
    switch (type) {
      case "ProjectCommentEvent":
        _text = "发表了 ";
        _icon = Icons.comment;
        break;
      case "CreateEvent":
        _text = "创建了 ";
        _icon = Icons.code;
        break;
      case "WatchEvent":
        _text = "Star 了 ";
        _icon = Icons.star_border;
        break;
      default:
        _text = "";
    }
    return Row(
      children: <Widget>[
        Icon(
          _icon,
          size: 16,
        ),
        SizedBox(width: 5),
        Text(
          _text,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  String _getComment(News news) {
    try {
      return news.payload.comment.body;
    } catch (e) {
      return "";
    }
  }

  String _getEventDesc(String type) {
    switch (type) {
      case "ProjectCommentEvent":
        return " 的评论";
        break;
      default:
        return "";
    }
  }
}
