import 'package:get/get.dart';
import 'package:laundry_flutter/app/singleton/my_singleton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  // Buat variabel untuk menyimpan status login
  final isLoggedIn = false.obs;
  final prefs = SharedPreferences.getInstance();
  MySingleton myInstance = MySingleton();

  // Metode untuk memeriksa status login
  Future<void> checkLoginStatus() async {
    // Anda dapat menggunakan SharedPreferences atau cara penyimpanan lainnya
    final prefs = await SharedPreferences.getInstance();
    final isUserLoggedIn = prefs.getBool(myInstance.TAG_IS_LOGIN) ?? false;
    // Periksa apakah pengguna sudah login
    if (isUserLoggedIn) {
      isLoggedIn.value = true;
    } else {
      isLoggedIn.value = false;
    }
  }

  // Metode untuk melakukan login
  Future<void> login() async {
    // Implementasi logika login di sini
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(myInstance.TAG_IS_LOGIN, true);

    isLoggedIn.value = true;
    // Misalnya, memeriksa kredensial pengguna dan mengatur isLoggedIn menjadi true jika berhasilf
  }

  // Metode untuk logout
  Future<void> logout() async {
    // Implementasi logika logout di sini
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(myInstance.TAG_IS_LOGIN, false);
    isLoggedIn.value = false;
    // Misalnya, menghapus token autentikasi dan mengatur isLoggedIn menjadi false
  }
}
