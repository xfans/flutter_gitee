import 'dart:convert';
import 'dart:io';
import 'package:flutter_gitee/model/files.dart';
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
  static String token = "";
  static String signin =
      "https://gitee.com/oauth/authorize?client_id=${ApiConfig.clientId}&redirect_uri=${ApiConfig.redirectUri}&response_type=code";
  static String tokenUrl =
      "https://gitee.com/oauth/token?grant_type=authorization_code&client_id=${ApiConfig.clientId}&redirect_uri=${ApiConfig.redirectUri}&client_secret=${ApiConfig.clientSecret}&code=";

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

  Future<User> getUser() async {
    try {
      var response = await http
          .get(base + "/v5/user?access_token=$token", headers: <String, String>{
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

  Future<List<Repo>> getRepo() async {
    try {
      var url =
              "$base/v5/user/repos?access_token=$token&visibility=all&sort=full_name&page=1&per_page=20";
      var response = await http.get(
          url,
          headers: <String, String>{
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

  Future<Readme> getReadme(String owner, String repo) async {
    try {
      //https://gitee.com/api/v5/repos/xfans/VoiceWaveView/readme?access_token=
      var response = await http.get(
          base + "/v5/repos/$owner/$repo/readme?access_token=$token",
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
      String owner, String repo, String path) async {
    try {
      var url =
          base + "/v5/repos/$owner/$repo/contents/$path?access_token=$token";
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
}
