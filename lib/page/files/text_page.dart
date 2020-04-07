import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gitee/model/files.dart';
import 'package:flutter_gitee/page/widget/include_appbar.dart';
import 'package:flutter_gitee/page/widget/load_content.dart';
import 'package:flutter_gitee/service/api.dart';

class TextPage extends StatefulWidget {
  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  Files _file;

  var _futureFile;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _file = ModalRoute.of(context).settings.arguments;
    _futureFile = Api().download(_file.name, _file.downloadUrl);
    return Scaffold(
      appBar: IncludeAppBar(
        title: _file.downloadUrl,
        rightIcon: Icons.share,
        onRightTap: () {},
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return LoadContent<List<int>>(
        future: _futureFile,
        contentBuilder: (data) {
          var content = utf8.decode(data);
          return Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            color: Colors.white,
            child: ListView(
              children: <Widget>[
                Text(
                  content,
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          );
        });
  }
}
