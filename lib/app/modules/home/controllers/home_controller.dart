import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:laundry_flutter/app/controller/auth_controller.dart';
import 'package:laundry_flutter/app/controller/user_data_controller.dart';
import 'package:laundry_flutter/app/data/models/user_data.dart';
import 'package:laundry_flutter/app/modules/home/controllers/helper/dialog_helper.dart';

class HomeController extends GetxController {
  final AuthController authController = AuthController();
  final DialogHelper dialogHelper = DialogHelper();
  final UserDataController userDataController = Get.put(UserDataController());

  void logOut() {
    authController.logout();
    userDataController.saveUserData(
        UserData(id: 0, username: '', email: '', token: ''), '');
    Get.offAllNamed('/login-page');
  }

  @override
  void onInit() {
    super.onInit();
  }

  void logOutDialog(BuildContext context) {
    dialogHelper.logOutDialog(context, logOut);
  }
}
