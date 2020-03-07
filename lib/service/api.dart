import 'dart:convert';
import 'dart:io';
import 'package:flutter_gitreader/model/repo.dart';
import 'package:flutter_gitreader/model/user.dart';
import 'package:http/http.dart' as http;

class Api {
  Api();
  String base = "https://gitee.com/api";
  String token = "ac70d0529882dcd67b57adcaae8ac08b";
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
  //curl -X GET --header 'Content-Type: application/json;charset=UTF-8' 'https://gitee.com/api/v5/user/repos?access_token=ac70d0529882dcd67b57adcaae8ac08b&visibility=all&sort=full_name&page=1&per_page=20'

  Future<List<Repo>> getRepo() async {
    try {
      var response = await http.get(
          base +
              "/v5/user/repos?access_token=$token&visibility=all&sort=full_name&page=1&per_page=20",
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      if (response.statusCode == 200) {
        List list = json.decode(response.body);
        List<Repo> result = [];
        list.forEach((item) {
          result.add(Repo.fromJson(item));
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
}
