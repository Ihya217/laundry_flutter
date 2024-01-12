import 'package:get/get.dart';
import 'package:laundry_flutter/app/data/models/pesanan_model.dart';
import 'package:laundry_flutter/app/modules/pesanan/controllers/pesanan_controller.dart';

class PesananDetailsController extends GetxController {
  final PesananController pesananController = Get.find();
  @override
  void onInit() {
    super.onInit();
    loadDataShop();
  }

  RxString nama = ''.obs;
  RxString alamatAntar = ''.obs;
  RxString alamatJemput = ''.obs;
  RxString deskripsi = ''.obs;
  RxNum harga = RxNum(0);
  RxNum berat = RxNum(0);
  RxString kodeClaim = ''.obs;
  RxString wa = ''.obs;
  RxString status = ''.obs;

  void loadDataShop() {
    final arguments = Get.arguments;
    List<PesananData>? pesananDataList =
        pesananController.pesananModel.value.data;
    if (pesananDataList != null &&
        arguments >= 0 &&
        arguments < pesananDataList.length) {
      PesananData currentPesananData = pesananDataList[arguments];

      nama.value = currentPesananData.description!;
      alamatAntar.value = currentPesananData.deliveryAddress!;
      alamatJemput.value = currentPesananData.pickupAddress!;
      deskripsi.value = currentPesananData.description!;
      berat.value = currentPesananData.weight!;
      harga.value = currentPesananData.total!;
      kodeClaim.value = currentPesananData.claimCode!;
      status.value = currentPesananData.status!;
      wa.value = currentPesananData.shop!.whatsapp!;
    } else {
      print("Data toko tidak tersedia atau indeks diluar rentang yang valid");
    }
  }
}
