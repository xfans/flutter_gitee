import 'package:flutter_gitee/model/user.dart';
import 'package:flutter_gitee/provider/config_provider.dart';

class UserModel extends ConfigChangeNotifier {
  User get user => profile.user;
  bool get isLogin => user != null;

  set user(User user) {
    if (profile.user == null || user.id != profile.user.id) {
      profile.user = user;
      print("set user");
      notifyListeners();
    }
  }
}
