import 'dart:convert';
import 'dart:io';
import 'package:flutter_gitee/model/files.dart';
import 'package:flutter_gitee/model/news.dart';
import 'package:flutter_gitee/model/readme.dart';
import 'package:flutter_gitee/model/repo.dart';
import 'package:flutter_gitee/model/token.dart';
import 'package:flutter_gitee/model/user.dart';
import 'package:flutter_gitee/service/api_config.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class Api {
  Api();
  String base = "https://gitee.com/api";
  static String accessToken = "";
  static String signin =
      "https://gitee.com/oauth/authorize?client_id=${ApiConfig.clientId}&redirect_uri=${ApiConfig.redirectUri}&response_type=code";
  static String tokenUrl =
      "https://gitee.com/oauth/token?grant_type=authorization_code&client_id=${ApiConfig.clientId}&redirect_uri=${ApiConfig.redirectUri}&client_secret=${ApiConfig.clientSecret}&code=";
  static String refreshTokenUrl =
      "https://gitee.com/oauth/token?grant_type=refresh_token&refresh_token=";
  Future<Token> getToken(String code) async {
    try {
      var response = await http.post(tokenUrl + code,
          headers: <String, String>{},
          body: <String, String>{
            "code": code,
            "redirect_uri": ApiConfig.redirectUri
          });
      if (response.statusCode == 200) {
        print(response.body);
        return Token.fromJson(jsonDecode(response.body));
      } else {
        print("error ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print(e.message);
      return null;
    }
  }

//https://gitee.com/oauth/token?grant_type=refresh_token&refresh_token={refresh_token}
  Future<Token> getrefreshToken(String refreshToken) async {
    try {
      var response = await http.post(refreshTokenUrl + refreshToken,
          headers: <String, String>{},
          body: <String, String>{
            "refresh_token": refreshToken,
          });
      if (response.statusCode == 200) {
        print(response.body);
        return Token.fromJson(jsonDecode(response.body));
      } else {
        print("error ${response.statusCode}");
        return Future.error(401);
      }
    } catch (e) {
      print(e.message);
      return Future.error(401);
    }
  }

  Future<User> getUser() async {
    try {
      var response = await http.get(base + "/v5/user?access_token=$accessToken",
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      if (response.statusCode == 200) {
        print(response.body);
        return User.fromJson(jsonDecode(response.body));
      } else {
        print("error ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print(e.message);
      return null;
    }
  }
  //curl -X GET --header 'Content-Type: application/json;charset=UTF-8' 'https://gitee.com/api/v5/user/repos?access_token=&visibility=all&sort=full_name&page=1&per_page=20'

  Future<List<Repo>> getRepos() async {
    try {
      var url =
          "$base/v5/user/repos?access_token=$accessToken&visibility=all&sort=full_name&page=1&per_page=20";
      var response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
      print(url);
      if (response.statusCode == 200) {
        Utf8Decoder utf8decoder = Utf8Decoder();
        List list = json.decode(utf8decoder.convert(response.bodyBytes));
        List<Repo> result = [];
        list.forEach((item) {
          result.add(Repo.fromJson(item));
        });
        print(result[0].toString());
        return result;
      } else {
        print("error ${response.body}");
        return null;
      }
    } catch (e) {
      print(e.message);
      return null;
    }
  }
//https://gitee.com/api/v5/repos/xfans/flutter_gitee?access_token=7e4a34e78af0774696b695c0af384720
    Future<Repo> getRepo(String fullName) async {
    try {
      var url =
          "$base/v5/repos/$fullName?access_token=$accessToken";
      var response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
      print(url);
      if (response.statusCode == 200) {
        Utf8Decoder utf8decoder = Utf8Decoder();
        return Repo.fromJson(
            jsonDecode(utf8decoder.convert(response.bodyBytes)));
      } else {
        print("error ${response.body}");
        return null;
      }
    } catch (e) {
      print(e.message);
      return null;
    }
  }

  Future<Readme> getReadme(String fullName) async {
    try {
      //https://gitee.com/api/v5/repos/xfans/VoiceWaveView/readme?access_token=
      var response = await http.get(
          base + "/v5/repos/$fullName/readme?access_token=$accessToken",
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      if (response.statusCode == 200) {
        print(response.body);
        Utf8Decoder utf8decoder = Utf8Decoder();
        return Readme.fromJson(
            jsonDecode(utf8decoder.convert(response.bodyBytes)));
      } else {
        print("error ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print(e.message);
      return null;
    }
  }

  //https://gitee.com/api/v5/repos/xfans/VoiceWaveView/contents/.?access_token=

  Future<List<Files>> getRepoFils(
      String fullName, String path) async {
    try {
      var url = base +
          "/v5/repos/$fullName/contents/$path?access_token=$accessToken";
      print(url);
      var response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
      if (response.statusCode == 200) {
        print(response.body);
        Utf8Decoder utf8decoder = Utf8Decoder();
        List list = json.decode(utf8decoder.convert(response.bodyBytes));
        List<Files> result = [];
        list.forEach((item) {
          result.add(Files.fromJson(item));
        });
        print(result[0].toString());
        return result;
      } else {
        print("error ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print(e.message);
      return null;
    }
  }

  Future<List<int>> download(String name, String url) async {
    Directory tempDir = await getApplicationDocumentsDirectory();
    String tempPath = tempDir.path;
    var file = new File(tempPath + "/" + name);
    if (file.existsSync()) file.deleteSync(recursive: true);
    var ios = file.openWrite(mode: FileMode.append);
    var response = await http.get(url);
    var bytes = response.bodyBytes;
    ios.add(bytes);
    ios.close();
    return bytes;
  }

  ///v5/search/repositories
  Future<List<Repo>> getSearchRepo(String key) async {
    try {
      var url =
          "$base/v5/search/repositories?access_token=$accessToken&q=$key&order=desc&page=1&per_page=20";
      var response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
      print(url);
      if (response.statusCode == 200) {
        Utf8Decoder utf8decoder = Utf8Decoder();
        List list = json.decode(utf8decoder.convert(response.bodyBytes));
        List<Repo> result = [];
        list.forEach((item) {
          result.add(Repo.fromJson(item));
        });
        print(result[0].toString());
        return result;
      } else {
        print("error ${response.body}");
        return null;
      }
    } catch (e) {
      print(e.message);
      return null;
    }
  }

  //https://gitee.com/api/v5/users/xfans/received_events?access_token=7e4a34e78af0774696b695c0af384720&page=1&per_page=20
  Future<List<News>> getNews(String name) async {
    try {
      var url =
          "$base/v5/users/$name/received_events?access_token=$accessToken&page=1&per_page=20";
      var response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
      print(url);
      if (response.statusCode == 200) {
        Utf8Decoder utf8decoder = Utf8Decoder();
        List list = json.decode(utf8decoder.convert(response.bodyBytes));
        List<News> result = [];
        list.forEach((item) {
          result.add(News.fromJson(item));
        });
        print(result[0].toString());
        return result;
      } else {
        print("error ${response.body}");
        return null;
      }
    } catch (e) {
      print(e.message);
      return null;
    }
  }
}
