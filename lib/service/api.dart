import 'dart:convert';
import 'dart:io';
import 'package:flutter_gitreader/model/user.dart';
import 'package:http/http.dart' as http;

class Api {
  Api();
  String base = "https://gitee.com/api/v5";
  Future<User> getUser() async {
    try {
      var response = await http.get(
          base + "/user?access_token=ee88fa4fc5998e0021ef5a92edf734e1",
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
}
