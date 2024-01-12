import 'package:get/get.dart';
import 'package:laundry_flutter/app/controller/user_data_controller.dart';

import '../controllers/login_page_controller.dart';

class LoginPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginPageController>(
      () => LoginPageController(),
    );
    Get.lazyPut<UserDataController>(
      () => UserDataController(),
    );
  }
}
