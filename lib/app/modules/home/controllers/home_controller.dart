import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:laundry_flutter/app/controller/auth_controller.dart';
import 'package:laundry_flutter/app/controller/user_data_controller.dart';
import 'package:laundry_flutter/app/data/models/promo_model.dart';
import 'package:laundry_flutter/app/data/models/shop_model.dart';
import 'package:laundry_flutter/app/data/models/user_data.dart';
import 'package:laundry_flutter/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:laundry_flutter/app/modules/home/controllers/helper/dialog_helper.dart';
import 'package:laundry_flutter/app/modules/pesanan/controllers/pesanan_controller.dart';

class HomeController extends GetxController {
  final Rx<PromoModel> promoModel = PromoModel().obs;
  final Rx<ShopModel> shopModel = ShopModel().obs;
  final AuthController authController = AuthController();
  final DialogHelper dialogHelper = DialogHelper();

  final UserDataController userDataController = Get.find();
  final PesananController pesananController = Get.find();
  final DashboardController dashboardController = Get.find();

  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    if (index == 2) {
      getPesanan();
    }
    update();
  }

  Future<void> refreshData() async {
    await dashboardController.getPromoFromApi();
    await dashboardController.getShopFromApi();
    await pesananController.getPesananFromApi();
  }

  RxBool isLoading = false.obs;

  void getPesanan() {
    pesananController.getPesananFromApi();
  }

  void logOut() {
    authController.logout();
    userDataController.saveUserData(
        UserData(id: 0, username: '', email: '', token: ''), '');
    Get.offAllNamed('/login-page');
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await userDataController.loadUserData();
    await authController.isLoggedIn.value;

    await dashboardController.getPromoFromApi();
    await dashboardController.getShopFromApi();
    await authController.checkLoginStatus();
  }

  void logOutDialog(BuildContext context) {
    dialogHelper.logOutDialog(context, logOut);
  }
}
