import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gitee/model/readme.dart';
import 'package:flutter_gitee/model/repo.dart';
import 'package:flutter_gitee/page/widget/include_appbar.dart';
import 'package:flutter_gitee/page/widget/item_info.dart';
import 'package:flutter_gitee/page/widget/load_content.dart';
import 'package:flutter_gitee/service/api.dart';
import 'package:flutter_gitee/style/color.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/svg.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var _futureReadme;
  var _futureRepo;
  Repo _repo;
  final controller = ScrollController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _repo = ModalRoute.of(context).settings.arguments;
    if (_futureRepo == null) {
      _futureRepo = Api().getRepo(_repo.fullName);
    }
    return Scaffold(
      appBar: IncludeAppBar(
        rightIcon: Icons.add_circle_outline,
        onRightTap: () {},
      ),
      body: LoadContent<Repo>(
          future: _futureRepo,
          contentBuilder: (repo) {
            return Container(
              color: Colors.white,
              child: ListView(
                children: <Widget>[
                  _buildUserInfo(repo),
                  Container(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        repo.name,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )),
                  Container(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      margin: EdgeInsets.only(top: 8, bottom: 8),
                      alignment: Alignment.centerLeft,
                      child: Text(repo.description,
                          style: TextStyle(fontSize: 16))),
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
                            repo,
                            repo.stared == true ? "STARED" : "STAR",
                            Icons.star_border),
                        SizedBox(width: 25),
                        _buildExpandedBtn(
                            repo,
                            repo.watched == true ? "WATCHING" : "WATCH",
                            Icons.remove_red_eye),
                      ],
                    ),
                  ),
                  Divider(height: 2),
                  ItemInfo("Issues", "${repo.openIssuesCount}", () {}),
                  Divider(height: 2),
                  ItemInfo("Pull Requests", "0", () {}),
                  Divider(height: 2),
                  ItemInfo("Browes code", "", () {
                    Navigator.of(context)
                        .pushNamed("files_page", arguments: repo);
                  }),
                  Container(
                    height: 20,
                    color: AppColors.lightGrey,
                  ),
                  _buildMdView(repo)
                ],
              ),
            );
          }),
    );
  }

  Expanded _buildExpandedBtn(Repo repo, String title, IconData icon) {
    return Expanded(
        child: OutlineButton(
      onPressed: () {
        if (title == "STARED" || title == "STAR") {
          if (repo.stared == false) {
            Api().start(repo.fullName).then((value) {
              if (value == true) {
                setState(() {
                  repo.stared = true;
                });
              }
            });
          } else {
            Api().unStart(repo.fullName).then((value) {
              if (value == true) {
                setState(() {
                  repo.stared = false;
                });
              }
            });
          }
        } else {
          if (repo.watched == false) {
            Api().watch(repo.fullName).then((value) {
              if (value == true) {
                setState(() {
                  repo.watched = true;
                });
              }
            });
          } else {
            Api().unWatch(repo.fullName).then((value) {
              if (value == true) {
                setState(() {
                  repo.watched = false;
                });
              }
            });
          }
        }
      },
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

  Container _buildMdView(Repo repo) {
    if (_futureReadme == null) {
      _futureReadme = Api().getReadme(_repo.fullName);
    }
    return Container(
        padding: EdgeInsets.all(15),
        child: LoadContent<Readme>(
          future: _futureReadme,
          contentBuilder: (data) {
            // return WebView(
            //   initialUrl: snapshot.data.downloadUrl,
            // );
            // var html = markdownToHtml(utf8
            //     .decode((base64Decode(snapshot.data.content))));
            //     print(html);
            // return Html(data: html.replaceAll("images/flutter_gitee.jpg", "https://gitee.com/xfans/flutter_gitee/raw/master/images/flutter_gitee.jpg"),showImages: true,);
            var md = utf8.decode((base64Decode(data.content)));
            print(md);
            // Markdown(data: null)
            return Text(md,style: TextStyle(fontSize: 16),);
            // var imageDirectory =
            //     "https://gitee.com/${repo.fullName}/raw/master/";
            // return MarkdownBody(
            //   selectable: true,
            //   data: md,
            //   imageBuilder: (uri) {
            //     if (uri.scheme == 'http' || uri.scheme == 'https') {
            //       if (uri.toString().endsWith(".svg") ||
            //           uri.toString().endsWith(".SVG")) {
            //         return SvgPicture.network(
            //           uri.toString(),
            //           placeholderBuilder: (BuildContext context) => Container(
            //               padding: const EdgeInsets.all(30.0),
            //               child: const CircularProgressIndicator()),
            //         );
            //       } else {
            //         return CachedNetworkImage(
            //           imageUrl: uri.toString(),
            //           placeholder: (context, url) =>
            //               CircularProgressIndicator(),
            //           errorWidget: (context, url, error) =>
            //               const Icon(Icons.error),
            //         );
            //       }
            //     } else if (uri.scheme == 'data') {
            //       return _handleDataSchemeUri(uri);
            //     } else if (uri.scheme == "resource") {
            //       return Image.asset(
            //         uri.path,
            //       );
            //     } else {
            //       Uri fileUri = imageDirectory != null
            //           ? Uri.parse(imageDirectory + uri.toString())
            //           : uri;
            //       if (fileUri.scheme == 'http' || fileUri.scheme == 'https') {
            //         if (fileUri.toString().endsWith(".svg") ||
            //             fileUri.toString().endsWith(".SVG")) {
            //           return SvgPicture.network(
            //             fileUri.toString(),
            //             placeholderBuilder: (BuildContext context) => Container(
            //                 padding: const EdgeInsets.all(30.0),
            //                 child: const CircularProgressIndicator()),
            //           );
            //         } else {
            //           return CachedNetworkImage(
            //             imageUrl: fileUri.toString(),
            //             placeholder: (context, url) =>
            //                 CircularProgressIndicator(),
            //             errorWidget: (context, url, error) =>
            //                 const Icon(Icons.error),
            //           );
            //         }
            //       } else {
            //         return Icon(Icons.error);
            //       }
            //     }
            //   },
            //   imageDirectory: imageDirectory,
            // );
          },
        ));
  }

  Widget _handleDataSchemeUri(Uri uri) {
    final String mimeType = uri.data.mimeType;
    if (mimeType.startsWith('image/')) {
      return Image.memory(
        uri.data.contentAsBytes(),
      );
    } else if (mimeType.startsWith('text/')) {
      return Text(uri.data.contentAsString());
    }
    return const SizedBox();
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
