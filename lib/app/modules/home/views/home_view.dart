import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:laundry_flutter/app/modules/dashboard/views/dashboard_view.dart';
import 'package:laundry_flutter/app/modules/pesanan/views/pesanan_view.dart';
import 'package:laundry_flutter/app/modules/profile/views/profile_view.dart';
import 'package:laundry_flutter/app/modules/search_page/views/search_page_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black.withOpacity(0),
    ));
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Get.theme.primaryColor,
        body: RefreshIndicator(
          onRefresh: controller.refreshData,
          color: Get.theme.highlightColor,
          backgroundColor: Get.theme.primaryColor,
          child: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                DashboardView(),
                SearchPageView(),
                PesananView(),
                ProfileView()
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            _bottomNavigationBarItem(
                icon: const Icon(
                  Icons.home,
                ),
                label: 'Home'),
            _bottomNavigationBarItem(
                icon: const Icon(
                  Icons.search,
                ),
                label: 'Cari'),
            _bottomNavigationBarItem(
                icon: const Icon(
                  Icons.local_laundry_service,
                ),
                label: 'Pesanan'),
            _bottomNavigationBarItem(
                icon: const Icon(
                  Icons.person,
                ),
                label: 'Profile'),
          ],
          type: BottomNavigationBarType.fixed,
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex,
          selectedItemColor: Get.theme.highlightColor,
          backgroundColor: Get.theme.primaryColor,
          unselectedItemColor: Colors.white,
        ),
      );
    });
  }
}

_bottomNavigationBarItem({
  required icon,
  String? label,
}) {
  return BottomNavigationBarItem(
    icon: icon,
    label: label,
  );
}
