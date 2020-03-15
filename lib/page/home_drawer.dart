import 'package:flutter/material.dart';

class HomeDrawer extends StatefulWidget {
  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
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
            title: Text("Local"),
            onTap: () {},
          ),
          ListTile(
            title: Text("Repositories"),
            onTap: () {},
          ),
          ListTile(
            title: Text("Start"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
