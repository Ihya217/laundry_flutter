import 'package:get/get.dart';
import 'package:laundry_flutter/app/controller/auth_controller.dart';
import 'package:laundry_flutter/app/controller/user_data_controller.dart';
import 'package:laundry_flutter/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:laundry_flutter/app/modules/pesanan/controllers/pesanan_controller.dart';
import 'package:laundry_flutter/app/modules/profile/controllers/profile_controller.dart';
import 'package:laundry_flutter/app/modules/search_page/controllers/search_page_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<UserDataController>(
      () => UserDataController(),
    );
    Get.lazyPut<PesananController>(
      () => PesananController(),
    );
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<SearchPageController>(
      () => SearchPageController(),
    );
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
  }
}
