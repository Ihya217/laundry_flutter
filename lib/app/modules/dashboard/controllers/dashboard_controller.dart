import 'package:get/get.dart';
import 'package:laundry_flutter/app/modules/home/controllers/home_controller.dart';

class DashboardController extends GetxController {
  final HomeController userDataController = Get.put(HomeController());
  //TODO: Implement DashboardController

  @override
  void onInit() {
    super.onInit();
  }

  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
