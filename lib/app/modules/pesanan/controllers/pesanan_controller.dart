import 'dart:ffi';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:laundry_flutter/app/data/models/pesanan_model.dart';
import 'package:laundry_flutter/app/data/provider/app_services_manager.dart';

class PesananController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  final Rx<PesananModel> pesananModel = PesananModel().obs;
  RxBool isLoading = false.obs;
  RxDouble totalHarga = 0.0.obs;

  Future<void> getPesananFromApi() async {
    isLoading.value = true;
    try {
      PesananModel pesananModelResponse = await AppServiceManager.getPesanan();
      List<PesananData>? pesananData = pesananModelResponse.data;

      if (pesananData != null) {
        // Sort the list based on the order of statuses
        pesananData.sort((a, b) {
          List<String> statusOrder = ['done', 'washing', 'process', 'queue'];

          int indexOfA = statusOrder.indexOf(a.status!.toLowerCase());
          int indexOfB = statusOrder.indexOf(b.status!.toLowerCase());

          return indexOfA.compareTo(indexOfB);
        });

        pesananModel.value = PesananModel(data: pesananData);

        // Calculate the total price
        double totalPrice = 0;
        for (PesananData pesanan in pesananData) {
          totalPrice += pesanan.total ?? 0;
        }

        totalHarga.value = totalPrice;
      }
    } catch (e) {
      print("Terjadi kesalahan saat mengambil data: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
