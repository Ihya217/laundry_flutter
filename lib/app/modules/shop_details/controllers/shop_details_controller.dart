import 'package:get/get.dart';
import 'package:laundry_flutter/app/data/models/shop_model.dart';
import 'package:laundry_flutter/app/modules/dashboard/controllers/dashboard_controller.dart';

class ShopDetailsController extends GetxController {
  final DashboardController dashboardController = Get.find();

  @override
  void onInit() {
    super.onInit();
    loadDataShop();
  }

  RxString nama = ''.obs;
  RxString alamat = ''.obs;
  RxString deskripsi = ''.obs;
  RxNum harga = RxNum(0);
  RxNum rating = RxNum(0);
  RxString kota = ''.obs;
  RxString wa = ''.obs;

  void loadDataShop() {
    final arguments = Get.arguments;
    List<ShopData>? shopDataList = dashboardController.shopModel.value.data;
    if (shopDataList != null &&
        arguments >= 0 &&
        arguments < shopDataList.length) {
      ShopData currentShopData = shopDataList[arguments];

      nama.value = currentShopData.name!;
      alamat.value = currentShopData.location!;
      deskripsi.value = currentShopData.description!;
      rating.value = currentShopData.rate!;
      harga.value = currentShopData.price!;
      kota.value = currentShopData.city!;
      wa.value = currentShopData.whatsapp!;
    } else {
      print("Data toko tidak tersedia atau indeks diluar rentang yang valid");
    }
  }
}
