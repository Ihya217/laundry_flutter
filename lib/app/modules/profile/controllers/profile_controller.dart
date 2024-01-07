import 'package:get/get.dart';
import 'package:laundry_flutter/app/controller/auth_controller.dart';
import 'package:laundry_flutter/app/controller/user_data_controller.dart';
import 'package:laundry_flutter/app/data/models/user_data.dart';

class ProfileController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  final AuthController authController = AuthController();
  final UserDataController userDataController = UserDataController();

  void logOut() {
    authController.logout();
    userDataController.saveUserData(
        UserData(id: 0, username: '', email: '', token: ''), '');
    Get.offAllNamed('/login-page');
  }
}
