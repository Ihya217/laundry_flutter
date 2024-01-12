import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:laundry_flutter/app/utils/pesanan_card_utils.dart';
import 'package:laundry_flutter/app/utils/skeleton_list_item_vertical.dart';

import '../controllers/pesanan_controller.dart';

class PesananView extends GetView<PesananController> {
  const PesananView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.primaryColor,
      appBar: AppBar(
        title: Obx(() => Row(
              children: [
                Text(
                  'Total Pesanan : ${controller.pesananModel.value?.data?.length ?? 0}',
                  style: Get.theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                Spacer(),
                Text(
                  "Rp.${NumberFormat("#,##0", "id_ID").format(controller.totalHarga.value)}",
                  style: Get.theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Get.theme.highlightColor),
                ),
              ],
            )),
        backgroundColor: Get.theme.primaryColor,
      ),
      body: Center(
        child: Obx(
          () => controller.isLoading.value
              ? ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return DarkSkeletonListItemVertical();
                  },
                )
              : ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: controller.pesananModel.value.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return PesananCardWidget(index: index);
                  },
                ),
        ),
      ),
    );
  }
}
