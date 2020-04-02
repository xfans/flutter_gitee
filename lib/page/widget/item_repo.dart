import 'package:flutter/material.dart';

class ItemRepo extends StatelessWidget {
  String title;
  String image;
  IconData rightIcon;
  GestureTapCallback onTap;
  Widget _rightWidget;
  ItemRepo(this.title, this.image, {this.rightIcon, this.onTap});
  @override
  Widget build(BuildContext context) {
    if (rightIcon != null) {
      _rightWidget = Icon(
        rightIcon,
        color: Colors.grey,
      );
    }else{
      _rightWidget = Container(height:0.0,width:0.0);
    }
    return InkWell(
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        height: 50,
        child: Row(children: <Widget>[
          Image.network(
            image,
            fit: BoxFit.contain,
            height: 30,
            width: 30,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(title, style: TextStyle(fontSize: 16)),
          ),
          _rightWidget
        ]),
      ),
      onTap: onTap,
    );
  }
}
