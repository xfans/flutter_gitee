import 'package:flutter/material.dart';
import 'package:flutter_gitee/provider/user_model.dart';
import 'package:flutter_gitee/service/api.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  var _isShow = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          // child: Center(
          //   child: Image.asset(
          //     'images/logo_gitee.png',
          //   ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(margin: EdgeInsets.only(bottom: 45), height: 45),
              Image.asset(
                'images/logo_gitee.png',
              ),
              Container(
                margin: EdgeInsets.only(top: 45, left: 15, right: 15),
                height: 45,
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("login_webview_page")
                        .then((result) {
                      setState(() {
                        _isShow = true;
                      });
                      _getToken(result);
                    });
                  },
                  color: Color(0xff000002),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                          height: 20,
                          width: 20,
                          child: _isShow
                              ? CircularProgressIndicator()
                              : Container()),
                      SizedBox(width: 20),
                      Text(
                        "SIGN IN",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 40),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }

  void _getToken(String code) async {
    var token = await Api().getToken(code);
    if (token != null) {
      UserModel userModel = Provider.of<UserModel>(context, listen: false);
      userModel.token = token;
      Api.token = token.accessToken;
      Navigator.of(context).pushReplacementNamed("main_main");
    }
  }
}
