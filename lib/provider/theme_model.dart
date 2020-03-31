import 'package:flutter/material.dart';
import 'package:flutter_gitreader/config/config.dart';
import 'package:flutter_gitreader/provider/config_provider.dart';

class ThemeModel extends ConfigChangeNotifier{
  Color get theme => Colors.white;

  set theme(Color color) {
    if (color != theme) {
      profile.theme = color.toString();
      notifyListeners();
    }
  }
}