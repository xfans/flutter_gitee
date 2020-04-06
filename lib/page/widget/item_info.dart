import 'package:flutter/material.dart';

class ItemInfo extends StatelessWidget {
  String left;
  String right;
  GestureTapCallback onTap;
  ItemInfo(this.left,this.right,this.onTap);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(left, style: TextStyle(fontSize: 16)),
            Text(right)
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
