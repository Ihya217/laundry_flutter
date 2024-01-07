import 'package:get/get.dart';
import 'package:laundry_flutter/app/data/models/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataController extends GetxController {
  RxInt userId = 0.obs;
  RxString name = ''.obs;
  RxString email = ''.obs;
  RxString token = ''.obs;

  // Fungsi untuk menyimpan data pengguna ke SharedPreferences
  Future<void> saveUserData(UserData userData, String tokenType) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('userId', userData.id);
    prefs.setString('username', userData.username);
    prefs.setString('email', userData.email);
    prefs.setString('token', userData.token);

    // Update nilai variabel observables
    userId.value = userData.id;
    name.value = userData.username;
    email.value = userData.email;
    token.value = userData.token;
  }

  // Fungsi untuk mengambil data pengguna dari SharedPreferences
  Future<void> loadUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    userId.value = prefs.getInt('userId') ?? 0;
    name.value = prefs.getString('username') ?? '';
    email.value = prefs.getString('email') ?? '';
    token.value = prefs.getString('token') ?? '';
  }
}
