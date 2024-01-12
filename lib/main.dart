// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:laundry_flutter/app/controller/auth_controller.dart';
import 'package:laundry_flutter/app/controller/user_data_controller.dart';
import 'package:laundry_flutter/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:laundry_flutter/app/modules/pesanan/controllers/pesanan_controller.dart';
import 'package:laundry_flutter/app/modules/profile/controllers/profile_controller.dart';
import 'package:laundry_flutter/app/modules/search_page/controllers/search_page_controller.dart';
import 'package:laundry_flutter/app/singleton/my_singleton.dart';
import 'package:laundry_flutter/app/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeApp();
  runApp(
    GetMaterialApp(
      title: "Aplikasi",
      initialRoute: await determineInitialRoute(),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      theme: AppTheme().darkTheme(),
    ),
  );
}

Future<void> initializeApp() async {
  await initializeUserData();
  initializeMySingleton();
  await initializeAuthController();
  initializeProfil();
  initializeSearch();
  initializeDashboard();
  initializePesanan();
}

Future<void> initializeUserData() async {
  final UserDataController userDataController = Get.put(UserDataController());
  await userDataController.loadUserData();
  String token = userDataController.token.value;
  String nama = userDataController.name.value;
  print(token);
  print(nama);
}

void initializeMySingleton() {
  MySingleton myInstance = MySingleton();
}

Future<void> initializeAuthController() async {
  final authController = AuthController();
  authController.checkLoginStatus();
  authController.isLoggedIn.value;
}

Future<void> initializeProfil() async {
  final ProfileController profileController = Get.put(ProfileController());
}

Future<void> initializePesanan() async {
  final PesananController pesananController = Get.put(PesananController());
}

Future<void> initializeSearch() async {
  final SearchPageController searchPageController =
      Get.put(SearchPageController());
}

Future<void> initializeDashboard() async {
  final DashboardController dashboardController =
      Get.put(DashboardController());
}

Future<String> determineInitialRoute() async {
  final prefs = await SharedPreferences.getInstance();
  final isUserLoggedIn = prefs.getBool(MySingleton().TAG_IS_LOGIN) ?? false;
  String initialRoute = isUserLoggedIn ? AppPages.home : AppPages.INITIAL;
  return initialRoute;
}
