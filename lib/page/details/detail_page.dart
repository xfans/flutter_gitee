import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gitee/model/readme.dart';
import 'package:flutter_gitee/model/repo.dart';
import 'package:flutter_gitee/page/widget/include_appbar.dart';
import 'package:flutter_gitee/service/api.dart';
import 'package:flutter_gitee/style/color.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var _futureReadme;
  Repo repo;
  final controller = ScrollController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    repo = ModalRoute.of(context).settings.arguments;
    _futureReadme = Api().getReadme(repo.namespace.name, repo.path);

    return Scaffold(
      appBar: IncludeAppBar(
        rightIcon: Icons.add_circle_outline,
        onRightTap: () {},
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            _buildUserInfo(repo),
            Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                alignment: Alignment.centerLeft,
                child: Text(
                  repo.name,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
            Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                margin: EdgeInsets.only(top: 8, bottom: 8),
                alignment: Alignment.centerLeft,
                child: Text(repo.description, style: TextStyle(fontSize: 16))),
            Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                margin: EdgeInsets.only(top: 8, bottom: 8),
                child: Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.star_border, size: 18),
                        Text("${repo.stargazersCount} stars",
                            style: TextStyle(fontSize: 16))
                      ],
                    ),
                    SizedBox(width: 8),
                    Row(children: <Widget>[
                      Icon(Icons.call_merge, size: 18),
                      Text("${repo.forksCount} forks",
                          style: TextStyle(fontSize: 16))
                    ]),
                  ],
                )),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildExpandedBtn(
                      repo.stared ? "STARED" : "STAR", Icons.star_border),
                  SizedBox(width: 25),
                  _buildExpandedBtn(repo.watched ? "WATCHING" : "WATCH",
                      Icons.remove_red_eye),
                ],
              ),
            ),
            Divider(height: 2),
            _buildItem("Issues", "${repo.openIssuesCount}", () {}),
            Divider(height: 2),
            _buildItem("Pull Requests", "0", () {}),
            Divider(height: 2),
            _buildItem("Browes code", "", () {
              Navigator.of(context).pushNamed("files_page",arguments: repo);
            }),
            Container(
              height: 20,
              color: AppColors.lightGrey,
            ),
            _buildMdView()
          ],
        ),
      ),
    );
  }

  Expanded _buildExpandedBtn(String title, IconData icon) {
    return Expanded(
        child: OutlineButton(
      onPressed: () {},
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 20,
            ),
            SizedBox(width: 5),
            Text(title)
          ],
        ),
      ),
    ));
  }

  InkWell _buildItem(String left, String num, GestureTapCallback onTap) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(left, style: TextStyle(fontSize: 16)),
            Text(num)
          ],
        ),
      ),
      onTap: onTap,
    );
  }

  Container _buildMdView() {
    return Container(
        padding: EdgeInsets.all(15),
        child: FutureBuilder<Readme>(
            future: _futureReadme,
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
                    // return WebView(
                    //   initialUrl: snapshot.data.downloadUrl,
                    // );
                    // var html = markdownToHtml(utf8
                    //     .decode((base64Decode(snapshot.data.content))));
                    //     print(html);
                    // return Html(data: html.replaceAll("images/flutter_gitee.jpg", "https://gitee.com/xfans/flutter_gitee/raw/master/images/flutter_gitee.jpg"),showImages: true,);
                    var md = utf8.decode((base64Decode(snapshot.data.content)));
                    // print(md);
                    // Markdown(data: null)
                    return MarkdownBody(
                      
                      selectable: true,
                      data: md,
                      imageDirectory:
                          "https://gitee.com/xfans/flutter_gitee/raw/master/",
                          
                    );
                  } else {
                    return Center(
                      child: Text('网络请求出错'),
                    );
                  }
              }
              return null;
            }));
  }

  Container _buildUserInfo(Repo repo) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Row(
        children: <Widget>[
          Image.network(
            repo.owner.avatarUrl,
            fit: BoxFit.contain,
            height: 17,
            width: 17,
          ),
          SizedBox(
            width: 8,
          ),
          Text(repo.owner.name, style: TextStyle(fontSize: 15))
        ],
      ),
    );
  }
}
