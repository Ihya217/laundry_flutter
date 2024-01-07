import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:laundry_flutter/app/modules/home/views/home_view.dart';
import 'package:laundry_flutter/app/modules/profile/views/profile_view.dart';
import 'package:laundry_flutter/app/modules/search_page/views/search_page_view.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 18, 26, 44),
    ));
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [HomeView(), SearchPageView(), ProfileView()],
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
                  Icons.person,
                ),
                label: 'Profile'),
          ],
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex,
          selectedItemColor: Theme.of(context).primaryColor,
        ),
      );
    });
  }
}

_bottomNavigationBarItem({required icon, String? label}) {
  return BottomNavigationBarItem(
    icon: icon,
    label: label,
  );
}
