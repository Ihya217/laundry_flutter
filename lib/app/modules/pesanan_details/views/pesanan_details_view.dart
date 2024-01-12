// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:laundry_flutter/app/modules/pesanan_details/controllers/pesanan_details_controller.dart';
import 'package:terbilang_id/terbilang_id.dart';

class PesananDetailsView extends GetView<PesananDetailsController> {
  const PesananDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Get.theme.highlightColor,
          child: Icon(
            Icons.chat_outlined,
            color: Get.theme.primaryColor,
          ),
          onPressed: () {
            Get.snackbar("Menuju Aplikasi WA", controller.wa.value);
          }),
      backgroundColor: Get.theme.primaryColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset("assets/images/header_started.png"),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
              child: Container(
                color: Colors.transparent,
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 190,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Get.theme.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 0,
                            blurRadius: 1,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              toBeginningOfSentenceCase(controller.nama.value),
                              style: Get.theme.textTheme.titleLarge
                                  ?.copyWith(fontSize: 25),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // Row(
                            //   children: [
                            //     Text(
                            //       'Kode Klaim  : ',
                            //       style: Get.theme.textTheme.titleLarge
                            //           ?.copyWith(
                            //               fontSize: 14,
                            //               color: Get.theme.highlightColor),
                            //     ),
                            //     Text(
                            //       controller.kodeClaim.value,
                            //       style: Get.theme.textTheme.titleLarge
                            //           ?.copyWith(fontSize: 14),
                            //     ),
                            //   ],
                            // ),

                            Text(
                              'Alamat Diantar  : ',
                              style: Get.theme.textTheme.titleLarge?.copyWith(
                                  fontSize: 14,
                                  color: Get.theme.highlightColor,
                                  fontWeight: FontWeight.normal),
                            ),

                            Text(
                              controller.alamatAntar.value,
                              style: Get.theme.textTheme.titleLarge
                                  ?.copyWith(fontSize: 14),
                              overflow: TextOverflow
                                  .ellipsis, // Tambahkan ini agar teks terpotong dan ditampilkan sebagai elipsis jika overflow
                              maxLines:
                                  3, // Tambahkan ini agar teks tidak lebih dari 1 baris
                            ),

                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Alamat Jemput  : ',
                              style: Get.theme.textTheme.titleLarge?.copyWith(
                                  fontSize: 14,
                                  color: Get.theme.highlightColor,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text(
                              controller.alamatJemput.value,
                              style: Get.theme.textTheme.titleLarge
                                  ?.copyWith(fontSize: 14),
                              overflow: TextOverflow
                                  .ellipsis, // Tambahkan ini agar teks terpotong dan ditampilkan sebagai elipsis jika overflow
                              maxLines:
                                  3, // Tambahkan ini agar teks tidak lebih dari 1 baris
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Berat  : ',
                                  style: Get.theme.textTheme.titleLarge
                                      ?.copyWith(
                                          fontSize: 14,
                                          color: Get.theme.highlightColor,
                                          fontWeight: FontWeight.normal),
                                ),
                                Flexible(
                                  child: Text(
                                    "${controller.berat.value} Kg",
                                    style: Get.theme.textTheme.titleLarge
                                        ?.copyWith(fontSize: 14),
                                    overflow: TextOverflow
                                        .ellipsis, // Tambahkan ini agar teks terpotong dan ditampilkan sebagai elipsis jika overflow
                                    maxLines:
                                        3, // Tambahkan ini agar teks tidak lebih dari 1 baris
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Status  : ',
                                  style: Get.theme.textTheme.titleLarge
                                      ?.copyWith(
                                          fontSize: 14,
                                          color: Get.theme.highlightColor,
                                          fontWeight: FontWeight.normal),
                                ),
                                Flexible(
                                  child: Text(
                                    controller.status.value,
                                    style: Get.theme.textTheme.titleLarge
                                        ?.copyWith(
                                            fontSize: 14,
                                            color: _getStatusColor(
                                                controller.status.value)),
                                    overflow: TextOverflow
                                        .ellipsis, // Tambahkan ini agar teks terpotong dan ditampilkan sebagai elipsis jika overflow
                                    maxLines:
                                        3, // Tambahkan ini agar teks tidak lebih dari 1 baris
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: Text(
                                "Rp.${NumberFormat("#,##0", "id_ID").format(controller.harga.value)}",
                                style: Get.theme.textTheme.titleLarge?.copyWith(
                                    fontSize: 25,
                                    color: Get.theme.highlightColor),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: Text(
                                '${Terbilang().terbilang(controller.harga.value.toDouble())} Rupiah',
                                style: Get.theme.textTheme.titleSmall?.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: Text(
                                "",
                                textAlign: TextAlign.justify,
                                style: Get.theme.textTheme.titleSmall
                                    ?.copyWith(fontSize: 12),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    'Whatsapp',
                                    style: Get.theme.textTheme.titleSmall
                                        ?.copyWith(fontSize: 14),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Get.snackbar("Menuju Aplikasi WA",
                                        controller.wa.value);
                                  },
                                  icon: const Icon(
                                    Icons.chat_outlined,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                ),
              ],
            ),
            Positioned(
              top: 20.0, // Adjust the top position based on your requirements
              left: 10.0, // Adjust the left position based on your requirements
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Get.theme.highlightColor,
                ),
                onPressed: () {
                  // Add your onPressed logic here
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String? status) {
    switch (status) {
      case "Queue":
        return Get.theme.highlightColor; // Warna kuning untuk status Queue
      case "Washing":
        return Colors.pink.shade200; // Warna pink untuk status Washing
      case "Done":
        return Colors.green.shade200; // Warna hijau untuk status Done
      case "Process":
        return Colors
            .lightBlue.shade200; // Warna biru muda untuk status Process
      default:
        return Get.theme.highlightColor; // Warna default jika tidak ada cocokan
    }
  }
}
