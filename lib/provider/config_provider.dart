import 'package:flutter/material.dart';
import 'package:flutter_gitee/config/config.dart';
import 'package:flutter_gitee/model/profile.dart';

class ConfigChangeNotifier extends ChangeNotifier{
  Profile get profile => Config.profile;

  @override
  void notifyListeners() {
    Config.saveProfile();
    super.notifyListeners();
  }
}