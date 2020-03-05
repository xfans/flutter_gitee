import 'package:flutter/material.dart';
import 'package:flutter_gitreader/config/config.dart';
import 'package:flutter_gitreader/model/profile.dart';

class ConfigChangeNotifier extends ChangeNotifier{
  Profile get profile => Config.profile;

  @override
  void notifyListeners() {
    Config.saveProfile();
    super.notifyListeners();
  }
}