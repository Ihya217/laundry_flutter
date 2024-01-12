import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:laundry_flutter/app/controller/auth_controller.dart';
import 'package:laundry_flutter/app/controller/user_data_controller.dart';
import 'package:laundry_flutter/app/data/models/promo_model.dart';
import 'package:laundry_flutter/app/data/models/shop_model.dart';
import 'package:laundry_flutter/app/data/models/user_data.dart';
import 'package:laundry_flutter/app/data/provider/app_services_manager.dart';
import 'package:laundry_flutter/app/modules/home/controllers/helper/dialog_helper.dart';
import 'package:laundry_flutter/app/modules/pesanan/controllers/pesanan_controller.dart';

class HomeController extends GetxController {
  final Rx<PromoModel> promoModel = PromoModel().obs;
  final Rx<ShopModel> shopModel = ShopModel().obs;
  final AuthController authController = AuthController();
  final DialogHelper dialogHelper = DialogHelper();
  final UserDataController userDataController = Get.put(UserDataController());
  final PesananController pesananController = Get.put(PesananController());

  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    if (index == 2) {
      getPesanan();
    }
    update();
  }

  RxBool isLoading = false.obs;

  Future<void> getPromoFromApi() async {
    isLoading.value = true;
    try {
      PromoModel promoModelResponse = await AppServiceManager.getPromo();
      List<Data>? promoData = promoModelResponse.data;

      if (promoData != null) {
        promoModel.value = PromoModel(data: promoData);

        // Set nilai promoId dan descriptions dengan data promo pertama
        if (promoData.isNotEmpty) {}
      }
    } catch (e) {
      print("Terjadi kesalahan saat mengambil data: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getShopFromApi() async {
    isLoading.value = true;
    try {
      ShopModel shopModelResponse = await AppServiceManager.getShop();
      List<ShopData>? shopData = shopModelResponse.data;

      if (shopData != null) {
        shopModel.value = ShopModel(data: shopData);
        // Set nilai promoId dan descriptions dengan data promo pertama
        if (shopData.isNotEmpty) {}
      }
    } catch (e) {
      print("Terjadi kesalahan saat mengambil data: $e");
    } finally {
      isLoading.value = false;
    }
  }

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
    await getPromoFromApi();
    await getShopFromApi();
  }

  void logOutDialog(BuildContext context) {
    dialogHelper.logOutDialog(context, logOut);
  }
}
