import 'package:laundry_flutter/app/data/provider/end_point/get_promo.dart';
import 'package:laundry_flutter/app/data/provider/end_point/get_search_city.dart';
import 'package:laundry_flutter/app/data/provider/end_point/get_shop.dart';
import 'package:laundry_flutter/app/data/provider/end_point/post_login.dart';
import 'package:laundry_flutter/app/data/provider/end_point/post_register.dart';

class AppServiceManager {
  static final PostLogin _login = PostLogin();
  static final PostRegister _register = PostRegister();
  static final GetPromo _getPromo = GetPromo();
  static final GetShop _getShop = GetShop();
  static final GetSearchCity _getSearchCity = GetSearchCity();

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

  static Future<dynamic> getShop() async {
    return _getShop.getShop();
  }

  static Future<dynamic> getSearchCity(String city) async {
    return _getSearchCity.getSearchCity(city);
  }
}
