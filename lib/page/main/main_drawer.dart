import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer(this.changed);
  final ValueChanged<String> changed;
  void _handleTap(BuildContext context, String name) {
    changed(name);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              child: Text("Name"),
              decoration: BoxDecoration(color: Colors.blue)),
          ListTile(
            title: Text("Repositories"),
            onTap: () {
              _handleTap(context, "Repo");
            },
          ),
          ListTile(
            title: Text("Local"),
            onTap: () {
              _handleTap(context, "Local");
            },
          ),
          ListTile(
            title: Text("Start"),
            onTap: () {
              _handleTap(context, "Start");
            },
          ),
        ],
      ),
    );
  }
}
