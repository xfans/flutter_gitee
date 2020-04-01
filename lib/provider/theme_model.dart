import 'package:flutter/material.dart';

import 'config_provider.dart';

class ThemeModel extends ConfigChangeNotifier{
  Color get theme => Colors.white;

  set theme(Color color) {
    if (color != theme) {
      profile.theme = color.toString();
      notifyListeners();
    }
  }
}