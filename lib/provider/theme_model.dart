import 'package:flutter/material.dart';
import 'package:flutter_gitreader/config/config.dart';
import 'package:flutter_gitreader/provider/config_provider.dart';

class ThemeModel extends ConfigChangeNotifier{
  ColorSwatch get theme => Config.themes
  .firstWhere((e) => e.value == profile.theme, orElse: () => Colors.blue);

  set theme(ColorSwatch color) {
    if (color != theme) {
      profile.theme = color[500].value as String;
      notifyListeners();
    }
  }
}