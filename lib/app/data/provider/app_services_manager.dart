import 'package:laundry_flutter/app/data/provider/end_point/get_promo.dart';
import 'package:laundry_flutter/app/data/provider/end_point/post_login.dart';
import 'package:laundry_flutter/app/data/provider/end_point/post_register.dart';

class AppServiceManager {
  static final PostLogin _login = PostLogin();
  static final PostRegister _register = PostRegister();
  static final GetPromo _getPromo = GetPromo();

  static Future<dynamic> login(String email, String password) async {
    return _login.postLogin(email, password);
  }

  static Future<dynamic> register(
      String username, String email, String password) async {
    return _register.postRegister(username, email, password);
  }

  static Future<dynamic> getPromo() async {
    return _getPromo.getPromo();
  }
}
