import 'package:flutter/material.dart';
import 'package:flutter_gitee/page/widget/include_appbar.dart';
import 'package:flutter_gitee/service/api.dart';
import 'package:flutter_gitee/service/api_config.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginWebViewPage extends StatefulWidget {
  @override
  _LoginWebViewPageState createState() => _LoginWebViewPageState();
}

class _LoginWebViewPageState extends State<LoginWebViewPage> {
  var _url = "";
  @override
  void initState() {
    super.initState();
    _url = Api.signin;
  }

  @override
  void dispose() {
    super.dispose();
  }

//https://gitee.com/oauth/authorize?client_id={client_id}&redirect_uri={redirect_uri}&response_type=code
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IncludeAppBar(
        title: "SIGN IN",
        onRightTap: () {},
      ),
      body: Container(
        child: _showWebView(context),
      ),
    );
  }

  Widget _showWebView(BuildContext context) {
    return WebView(
      initialUrl: _url,

      ///初始化url
      javascriptMode: JavascriptMode.unrestricted,

      ///JS执行模式
      onWebViewCreated: (WebViewController webViewController) {
        ///在WebView创建完成后调用，只会被调用一次
      },

      navigationDelegate: (NavigationRequest request) {
        //路由委托（可以通过在此处拦截url实现JS调用Flutter部分）；
        ///通过拦截url来实现js与flutter交互
        if (request.url.startsWith(ApiConfig.redirectUri)) {
          print('blocking navigation to $request}');
          var url = request.url;
          if (url.contains("code=")) {
            var code = url.substring(url.indexOf("code="), url.length);
            code = code.split("=")[1];
            print("code:$code");
            Navigator.of(context).pop(code);
          }
          return NavigationDecision.prevent;

          ///阻止路由替换，不能跳转，因为这是js交互给我们发送的消息
        }

        return NavigationDecision.navigate;

        ///允许路由替换
      },
      onPageFinished: (String url) {
        ///页面加载完成回调
        print('Page finished loading: $url');
      },
    );
  }
}
