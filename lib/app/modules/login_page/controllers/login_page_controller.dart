import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_flutter/app/controller/auth_controller.dart';
import 'package:laundry_flutter/app/controller/user_data_controller.dart';
import 'package:laundry_flutter/app/data/models/user_data.dart';
import 'package:laundry_flutter/app/data/provider/app_services_manager.dart';
import 'package:laundry_flutter/app/singleton/my_singleton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageController extends GetxController {
  var showPassword = false.obs;
  var isLoggedIn = false.obs;
  RxBool isLoading = false.obs;
  final authController = AuthController(); // Buat instance AuthController
  MySingleton myInstance = MySingleton();
  UserDataController userDataController = Get.find<UserDataController>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() async {
    try {
      isLoading.value = true;

      String email = usernameController.text;
      String password = passwordController.text;

      var value = await AppServiceManager.login(email, password);

      if (value != null && value.isNotEmpty) {
        // Respons adalah Map<String, dynamic>
        Map<String, dynamic> response = value;

        if (response.containsKey("data")) {
          Map<String, dynamic> data = response["data"];

          int userId = data["id"];
          String name = data["username"];
          String userEmail = data["email"];

          String token = response["token"];

          authController.login();
          Get.snackbar(
            'Login Berhasil',
            'Selamat Datang, $name',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.blue,
            colorText: Colors.white,
          );
          await userDataController.saveUserData(
            UserData(
              id: userId,
              username: name,
              email: userEmail,
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
              token: token,
            ),
            token,
          );
          print(userDataController.token.value);

          Get.offAllNamed('/home');
        } else {
          Get.snackbar(
            'Login Gagal',
            'Data tidak ditemukan dalam respons JSON',
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } else {
        // Tangani respons yang kosong atau tidak valid sesuai kebutuhan
        print("Respons tidak valid atau kosong");
        Get.snackbar(
          'Login Gagal',
          'Email atau Password salah',
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      // Tangani kesalahan parsing atau kesalahan lainnya
      print("Terjadi kesalahan saat parsing respons: $e");
      print("Email: ${usernameController.text}");
      print("Password: ${passwordController.text}");
      Get.snackbar(
        'Login Gagal',
        'Email atau Password salah',
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> saveUserData(int userId, String name, String email, String token,
      String tokenType) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('userId', userId);
    prefs.setString('name', name);
    prefs.setString('email', email);
    prefs.setString('token', token);
    prefs.setString('tokenType', tokenType);
  }

  void logOut() {
    isLoggedIn.value = false;
  }

  void toRegisterPage() {
    Get.toNamed('/register-page');
  }

  void toggleShowPassword() {
    showPassword.value = !showPassword.value;
  }

  void intentLupaPassword() {
    Get.toNamed('/lupa-password');
  }

  String get passwordLabel =>
      showPassword.value ? 'Hide Password' : 'Show Password';

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();

    super.dispose();
  }
}
