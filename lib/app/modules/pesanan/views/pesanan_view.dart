import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:laundry_flutter/app/utils/pesanan_card_utils.dart';

import '../controllers/pesanan_controller.dart';

class PesananView extends GetView<PesananController> {
  const PesananView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.primaryColor,
      appBar: AppBar(
        title: const Text('Pesanan Anda'),
        backgroundColor: Get.theme.primaryColor,
      ),
      body: Center(
        child: SizedBox(
          child: Obx(
            () => controller.isLoading.value
                ? Center(child: const Text('Memuat Data..'))
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: controller.pesananModel.value.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return PesananCardWidget(index: index);
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
