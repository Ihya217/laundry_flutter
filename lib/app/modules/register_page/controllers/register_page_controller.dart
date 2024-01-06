import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_flutter/app/controller/auth_controller.dart';
import 'package:laundry_flutter/app/controller/user_data_controller.dart';
import 'package:laundry_flutter/app/data/provider/app_services_manager.dart';
import 'package:laundry_flutter/app/modules/login_page/controllers/login_page_controller.dart';

class RegisterPageController extends GetxController {
  var showPassword = false.obs;
  RxBool isLoading = false.obs;

  final authController = AuthController(); // Buat instance AuthController
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final LoginPageController loginPageController = LoginPageController();
  final UserDataController userDataController = Get.find<UserDataController>();

  void register() async {
    try {
      isLoading.value = true;

      String username = usernameController.text;
      String email = emailController
          .text; // Ganti dengan emailController sesuai dengan controller yang sesuai
      String password = passwordController.text;

      var value = await AppServiceManager.register(username, email, password);

      if (value != null && value.isNotEmpty) {
        // Respons adalah Map<String, dynamic>
        Map<String, dynamic> response = value;

        if (response.containsKey("data")) {
          Map<String, dynamic> data = response["data"];

          int userId = data["id"];
          String username = data["username"];
          String userEmail = data["email"];

          Get.offAllNamed('/login-page');
          Get.snackbar(
            'Registrasi Berhasil',
            'Silahkan Login',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.blue,
            colorText: Colors.white,
          );
        } else {
          Get.snackbar(
            'Registrasi Gagal',
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
          'Registrasi Gagal',
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
      print("Email: ${emailController.text}"); // Ganti dengan emailController
      print("Password: ${passwordController.text}");
      Get.snackbar(
        'Registrasi Gagal',
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

  void toggleShowPassword() {
    showPassword.value = !showPassword.value;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
