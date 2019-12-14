import 'package:shared_preferences/shared_preferences.dart';
import 'package:training_flutter_krungsri/src/models/user.dart';
import 'package:training_flutter_krungsri/src/utils/constant.dart';

class AuthService {
  Future<bool> login(User user) async {
    var pref = await SharedPreferences.getInstance();
    if (user.username == 'cm@gmail.com' && user.password == '123456789') {
      pref.setBool(Constant.IS_LOGIN_PREF, true);
      pref.setString(Constant.USERNAME_PREF, user.username);
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    var pref = await SharedPreferences.getInstance();
    pref.remove(Constant.IS_LOGIN_PREF);
  }

  Future<bool> isLogin() async {
    var pref = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 2));
    return pref.get(Constant.IS_LOGIN_PREF) ?? false;
  }
}
