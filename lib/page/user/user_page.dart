import 'package:flutter/material.dart';
import 'package:flutter_gitee/model/user.dart';
import 'package:flutter_gitee/page/widget/include_appbar.dart';
import 'package:flutter_gitee/page/widget/item_info.dart';
import 'package:flutter_gitee/provider/user_model.dart';
import 'package:flutter_gitee/service/api.dart';
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  User _user;
  @override
  void initState() {
    super.initState();
    _getUser();
  }

  void _getUser() async {
    _user = await Api().getUser();
    if (_user != null) {
      UserModel userModel = Provider.of<UserModel>(context, listen: false);
      userModel.user = _user;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserModel userModel = Provider.of<UserModel>(context, listen: true);
    if (userModel.user == null) {
      return Scaffold(
        appBar: IncludeAppBar(
        rightIcon: Icons.settings,
        onRightTap: () {},
      ),body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      appBar: IncludeAppBar(
        rightIcon: Icons.settings,
        onRightTap: () {},
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Padding(
              child: Row(
                children: <Widget>[
                  Image.network(
                    userModel.user.avatarUrl,
                    fit: BoxFit.contain,
                    height: 60,
                    width: 60,
                  ),
                  SizedBox(width: 15),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          userModel.user.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        SizedBox(height: 8),
                        Text(userModel.user.bio)
                      ])
                ],
              ),
              padding: EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
              child: Row(children: <Widget>[
                Icon(
                  Icons.link,
                  size: 15,
                ),
                SizedBox(width: 5),
                Text(userModel.user.blog)
              ]),
            ),
            Padding(
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
                child: Row(children: <Widget>[
                  Icon(
                    Icons.person_outline,
                    size: 15,
                  ),
                  SizedBox(width: 5),
                  Text(
                      "${userModel.user.followers} followers · ${userModel.user.following} following"),
                ])),
            SizedBox(height: 15),
            Divider(height: 2),
            ItemInfo("Repositories", "${userModel.user.publicRepos}", () {}),
            // Divider(height: 2),
            // ItemInfo("Organizations", "${userModel.user.publicRepos}", () {}),
            Divider(height: 2),
            ItemInfo("Starred", "${userModel.user.stared}", () {}),
            Divider(height: 2),
            ItemInfo("Following", "${userModel.user.following}", () {}),
            Divider(height: 2),
          ],
        ),
      ),
    );
  }
}
