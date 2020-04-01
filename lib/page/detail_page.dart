import 'package:flutter/material.dart';
import 'package:flutter_gitee/model/repo.dart';

class DetailPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final Repo repo = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(repo.name),
      ),
      body: Text(repo.description),
    );
  }
}