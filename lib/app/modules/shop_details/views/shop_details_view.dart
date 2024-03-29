import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/shop_details_controller.dart';

class ShopDetailsView extends GetView<ShopDetailsController> {
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
                        padding: EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.nama.value,
                              style: Get.theme.textTheme.titleLarge
                                  ?.copyWith(fontSize: 25),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Row(
                              children: [
                                Text(
                                  controller.kota.value + ', ',
                                  style: Get.theme.textTheme.titleLarge
                                      ?.copyWith(fontSize: 14),
                                ),
                                Text(
                                  controller.alamat.value,
                                  style: Get.theme.textTheme.titleLarge
                                      ?.copyWith(fontSize: 14),
                                ),
                              ],
                            ),
                            Row(children: [
                              Text(
                                controller.rating.value.toString(),
                                style: Get.theme.textTheme.titleSmall
                                    ?.copyWith(fontSize: 12),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 12,
                              )
                            ]),
                            Text(
                              "Rp.${NumberFormat("#,##0", "id_ID").format(controller.harga.value)}",
                              style: Get.theme.textTheme.titleLarge?.copyWith(
                                  fontSize: 25,
                                  color: Get.theme.highlightColor),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              controller.deskripsi.value,
                              textAlign: TextAlign.justify,
                              style: Get.theme.textTheme.titleSmall
                                  ?.copyWith(fontSize: 12),
                            ),
                            SizedBox(
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
                                  icon: Icon(
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
}
