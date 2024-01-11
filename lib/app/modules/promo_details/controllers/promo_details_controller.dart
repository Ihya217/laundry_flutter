import 'package:get/get.dart';
import 'package:laundry_flutter/app/data/models/promo_model.dart';
import 'package:laundry_flutter/app/data/models/shop_model.dart';
import 'package:laundry_flutter/app/modules/dashboard/controllers/dashboard_controller.dart';

class PromoDetailsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    loadDataPromo();
  }

  final DashboardController dashboardController = Get.find();
  RxString nama = ''.obs;
  RxString alamat = ''.obs;
  RxString deskripsi = ''.obs;
  RxString deskripsiPromo = ''.obs;
  RxNum hargaSekarang = RxNum(0);
  RxNum hargaDulu = RxNum(0);
  RxNum rating = RxNum(0);
  RxString kota = ''.obs;
  RxString wa = ''.obs;

  void loadDataPromo() {
    final arguments = Get.arguments;
    List<Data>? promoDataList = dashboardController.promoModel.value.data;
    if (promoDataList != null &&
        arguments >= 0 &&
        arguments < promoDataList.length) {
      Data currentPromoData = promoDataList[arguments];

      deskripsiPromo.value = currentPromoData.description ?? "";
      hargaDulu.value = currentPromoData.oldPrice ?? 0;
      hargaSekarang.value = currentPromoData.newPrice ?? 0;

      Shop? currentShop = currentPromoData.shop;

      if (currentShop != null) {
        nama.value = currentShop.name ?? "";
        alamat.value = currentShop.location ?? "";
        kota.value = currentShop.city ?? "";
        deskripsi.value = currentShop.description ?? "";
        rating.value = currentShop.rate ?? 0;
        wa.value = currentShop.whatsapp ?? "";
      }

      // Menampilkan harga
      hargaSekarang.value = currentPromoData.newPrice!;
      hargaDulu.value = currentPromoData.oldPrice!;
    } else {
      print("Data toko tidak tersedia atau indeks diluar rentang yang valid");
    }
  }
}
