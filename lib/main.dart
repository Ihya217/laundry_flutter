// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:laundry_flutter/app/singleton/my_singleton.dart';
import 'package:laundry_flutter/app/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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

Future<String> determineInitialRoute() async {
  final prefs = await SharedPreferences.getInstance();
  final isUserLoggedIn = prefs.getBool(MySingleton().TAG_IS_LOGIN) ?? false;
  String initialRoute = isUserLoggedIn ? AppPages.home : AppPages.INITIAL;
  return initialRoute;
}
