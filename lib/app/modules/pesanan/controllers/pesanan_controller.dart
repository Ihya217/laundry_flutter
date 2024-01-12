import 'package:get/get.dart';
import 'package:laundry_flutter/app/data/models/pesanan_model.dart';
import 'package:laundry_flutter/app/data/provider/app_services_manager.dart';

class PesananController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  final Rx<PesananModel> pesananModel = PesananModel().obs;
  RxBool isLoading = false.obs;

  Future<void> getPesananFromApi() async {
    isLoading.value = true;
    try {
      PesananModel pesananModelResponse = await AppServiceManager.getPesanan();
      List<PesananData>? pesananData = pesananModelResponse.data;

      if (pesananData != null) {
        pesananModel.value = PesananModel(data: pesananData);
        if (pesananData.isNotEmpty) {}
      }
    } catch (e) {
      print("Terjadi kesalahan saat mengambil data: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
