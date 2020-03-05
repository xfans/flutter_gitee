import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_gitreader/style/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/profile.dart';

const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
];

class Config{
  static SharedPreferences _sp;
  static List<MaterialColor> themes = _themes;
  static Profile profile = new Profile();

  static Future init() async{
    _sp = await SharedPreferences.getInstance();
    var _profileStr = _sp.getString("profile");
    if(_profileStr != null){
      try{
        profile = Profile.fromJson(jsonDecode(_profileStr));
      }catch(e){
        print(e);
      }
    }
  }

  static saveProfile(){
    _sp.setString("profile", jsonEncode(profile.toJson()));
  }
} 