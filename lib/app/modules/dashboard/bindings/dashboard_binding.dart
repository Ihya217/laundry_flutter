import 'package:get/get.dart';
import 'package:laundry_flutter/app/controller/user_data_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );

    Get.lazyPut<UserDataController>(
      () => UserDataController(),
    );
  }
}
