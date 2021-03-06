import 'package:flutter_gitee/model/token.dart';
import 'package:flutter_gitee/model/user.dart';
import 'package:flutter_gitee/provider/config_provider.dart';

class UserModel extends ConfigChangeNotifier {
  User get user => profile.user;
  Token get token => profile.token;
  bool get isLogin => token != null;


  set user(User user) {
    if (user != null) {
      profile.user = user;
      notifyListeners();
    }
  }

  set token(Token token) {
    if (token != null) {
      profile.token = token;
      notifyListeners();
    }
  }
}
