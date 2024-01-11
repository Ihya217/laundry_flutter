import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:laundry_flutter/app/utils/promo_card_utils.dart';
import 'package:laundry_flutter/app/utils/product_card_utils.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    final TextStyle titleLarge = Theme.of(context).textTheme.titleLarge!;
    final TextStyle titleSmall = Theme.of(context).textTheme.titleSmall!;
    final TextStyle labelSmall = Theme.of(context).textTheme.labelSmall!;

    return Scaffold(
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 50, 5, 30),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.11)),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 40.0,
                              backgroundImage:
                                  AssetImage('assets/images/user_image.jpg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ihya217',
                                    style: titleLarge.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                  Text('Ihya217@gmail.com',
                                      style: titleSmall.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Colors.black)),
                                ],
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.settings,
                                color: Colors.white,
                                size: 30,
                              ),
                              alignment: Alignment.topRight,
                            )
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(14, 0, 0,
                                      5), // Sesuaikan dengan margin yang diinginkan
                                  child: Text(
                                    'Promo Terbaru',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 180.0,
                                  child: Obx(
                                    () => controller.isLoading.value
                                        ? Center(
                                            child: const Text('Memuat Data..'))
                                        : ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: controller.promoModel
                                                    .value.data?.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              var promo = controller.promoModel
                                                  .value.data![index];
                                              return PromoCardWidget(
                                                  index: index);
                                            },
                                          ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(14, 0, 0,
                                      5), // Sesuaikan dengan margin yang diinginkan
                                  child: Text(
                                    'Shop',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 180.0,
                                  child: Obx(
                                    () => controller.isLoading.value
                                        ? Center(
                                            child: const Text('Memuat Data..'))
                                        : ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: controller.shopModel
                                                    .value.data?.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              var shop = controller
                                                  .shopModel.value.data![index];
                                              return ProductCardWidget(
                                                  index: index);
                                            },
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ])),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      // body: SafeArea(
      //   child: IndexedStack(
      //     index: controller.tabIndex,
      //     children: [HomeView(), SearchPageView(), ProfileView()],
      //   ),
      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     _bottomNavigationBarItem(
      //         icon: const Icon(
      //           Icons.home,
      //         ),
      //         label: 'Home'),
      //     _bottomNavigationBarItem(
      //         icon: const Icon(
      //           Icons.search,
      //         ),
      //         label: 'Cari'),
      //     _bottomNavigationBarItem(
      //         icon: const Icon(
      //           Icons.person,
      //         ),
      //         label: 'Profile'),
      //   ],
      //   onTap: controller.changeTabIndex,
      //   currentIndex: controller.tabIndex,
      //   selectedItemColor: Theme.of(context).primaryColor,
      // ),
    );
  }
}
