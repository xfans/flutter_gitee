import 'package:flutter/material.dart';
import 'package:flutter_gitreader/loading.dart';
import 'package:provider/provider.dart';
import 'page/home_page.dart';
import 'page/login_page.dart';
import 'provider/repos_model.dart';
import 'provider/theme_model.dart';
import 'provider/user_model.dart';

void main() =>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserModel()),
        ChangeNotifierProvider.value(value: ThemeModel()),
        ChangeNotifierProvider.value(value: ReposModel())
      ],
      child: Consumer<ThemeModel>(
        builder: (BuildContext context,themeMode,Widget chile){
          return MaterialApp(
            theme: ThemeData(
                primaryColor: themeMode.theme,
              ),
              home: LoadingPage(),
              routes: <String,WidgetBuilder>{
                "loading":(context) => LoadingPage(),
                "login":(context) => LoginPage(),
                "home":(context) => HomePage(),
              }
          );
        }
      ),
    );
  }
}

