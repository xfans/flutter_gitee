import 'package:flutter/material.dart';

class IncludeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String rightText;
  final IconData rightIcon;
  final GestureTapCallback onRightTap;
  Widget _rightWidget;
  IncludeAppBar(
      {this.title = "", this.rightText = "", this.rightIcon, this.onRightTap});
  @override
  Widget build(BuildContext context) {
    if (rightText != null) {
      _rightWidget = InkWell(
        child: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 15, left: 15),
            child: Text(
              rightText,
              style: TextStyle(fontSize: 16, color: Colors.blue),
            )),
        onTap: onRightTap,
      );
    }
    if (rightIcon != null) {
      _rightWidget = IconButton(
          icon: Icon(
            rightIcon,
            color: Colors.blue,
          ),
          onPressed: onRightTap);
    }
    if (_rightWidget == null) {
      _rightWidget = Container(height: 0.0, width: 0.0);
    }
    return AppBar(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(title),
      leading: InkWell(
        child: Icon(Icons.arrow_back),
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
      actions: <Widget>[_rightWidget],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
