import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_gitee/model/repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/profile.dart';

const _themes = <Color>[
  Colors.white,
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
];

class Config {
  static SharedPreferences _sp;
  static List<Color> themes = _themes;
  static Profile profile = new Profile();

  static Future init() async {
    _sp = await SharedPreferences.getInstance();
    var _profileStr = _sp.getString("profile");
    if (_profileStr != null) {
      try {
        profile = Profile.fromJson(jsonDecode(_profileStr));
      } catch (e) {
        print(e);
      }
    }
  }

  static saveProfile() {
    _sp.setString("profile", jsonEncode(profile.toJson()));
  }

  static saveFavorites(List<Repo> list) {
    var json = jsonEncode(list);
    _sp.setString("favorites", json);
  }

  static List<Repo> getFavorites() {
    var str = _sp.getString("favorites");
    List list = json.decode(str);
    List<Repo> result = [];
    list.forEach((item) {
      result.add(Repo.fromJson(item));
    });
    return result;
  }
}
