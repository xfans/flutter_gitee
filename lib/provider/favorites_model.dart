import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_gitee/config/config.dart';
import 'package:flutter_gitee/model/divider_item.dart';
import 'package:flutter_gitee/model/feature.dart';
import 'package:flutter_gitee/model/title_item.dart';

import '../model/repo.dart';

class FavoritesModel with ChangeNotifier {
  final List<Repo> _list = [];
  final List<Object> _homeList = [];
  final List<Repo> _favoList = [];
  UnmodifiableListView<Repo> get repos => UnmodifiableListView(_getList());

  List<Object> get homeRepos{
    _homeList.clear();
    _homeList.add(TitleItem("My Work", "", ""));
    _homeList.add(Feature("images/home_issues.png", "Issues", ""));
    _homeList.add(Feature("images/home_pr.png", "Pull Requests", ""));
    _homeList.add(Feature("images/home_repo.png", "Repositories", ""));
    // _homeList.add(Feature("images/home_org.png", "Organizations", ""));
    _homeList.add(DividerItem());
    _homeList.add(TitleItem("Favorites", "EDIT", ""));
    _homeList.addAll(_getList());
    return _homeList;
  }

  List<Repo> favoRepos(List<Repo> inServer){
    var locals = repos;
    List<Repo> servers = List();
    servers.addAll(inServer);
    _favoList.clear();
    _favoList.addAll(locals);
    var willRemove = List();
    servers.forEach((item) {
      locals.forEach((i) {
        item.isFavorite = false;
        if (item.id == i.id) {
          willRemove.add(item);
        }
      });
    });
    willRemove.forEach((item) {
      servers.remove(item);
    });
    _favoList.addAll(servers);
    return _favoList;
  }
  
  set repos(List<Repo> list) {
    if (list != null) {
      _list.addAll(list);
      notifyListeners();
    }
  }

  List<Repo> _getList() {
    _list.clear();
    _list.addAll(Config.getFavorites());
    return _list;
  }

  add(Repo repo) {
    if (repo != null) {
      repo.isFavo = !repo.isFavo;
      if (repo.isFavo) {
        if (!_list.contains(repo)) {
          _list.add(repo);
        }
      } else {
        if (_list.contains(repo)) {
          _list.remove(repo);
        }
      }
      Config.saveFavorites(_list);
      notifyListeners();
    }
  }
}
