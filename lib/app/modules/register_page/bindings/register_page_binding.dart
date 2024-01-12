import 'package:get/get.dart';
import 'package:laundry_flutter/app/controller/user_data_controller.dart';

import '../controllers/register_page_controller.dart';

class RegisterPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterPageController>(() => RegisterPageController());
    final UserDataController userDataController = Get.put(UserDataController());
    userDataController.loadUserData();
  }
}
