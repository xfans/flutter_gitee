import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_gitreader/model/repo.dart';

class ReposModel with ChangeNotifier {
  final List<Repo> _list = [];
  UnmodifiableListView<Repo> get repos => UnmodifiableListView(_list);

  set repos(List<Repo> list) {
    if (list != null) {
      _list.addAll(list);
      notifyListeners();
    }
  }
}
