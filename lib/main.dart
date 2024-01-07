import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:laundry_flutter/app/controller/auth_controller.dart';
import 'package:laundry_flutter/app/controller/user_data_controller.dart';
import 'package:laundry_flutter/app/singleton/my_singleton.dart';
import 'package:laundry_flutter/app/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: options,
  // );
  // await FirebaseApi().initNotifications();
  await initializeApp();
  runApp(
    GetMaterialApp(
      title: "Aplikasi",
      initialRoute: await determineInitialRoute(),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      theme: AppTheme().lightTheme(),
    ),
  );
}

Future<void> initializeApp() async {
  await initializeUserData();
  initializeMySingleton();
  await initializeAuthController();
}

Future<void> initializeUserData() async {
  final UserDataController userDataController = Get.put(UserDataController());
  await userDataController.loadUserData();
}

void initializeMySingleton() {
  MySingleton myInstance = MySingleton();
}

Future<void> initializeAuthController() async {
  final authController = AuthController();
  authController.checkLoginStatus();
  authController.isLoggedIn.value;
}

Future<String> determineInitialRoute() async {
  final prefs = await SharedPreferences.getInstance();
  final isUserLoggedIn = prefs.getBool(MySingleton().TAG_IS_LOGIN) ?? false;
  String initialRoute = isUserLoggedIn ? AppPages.dashboard : AppPages.INITIAL;
  // print(isUserLoggedIn.toString());
  return initialRoute;
}

class LandingPage extends StatelessWidget {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 54,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
            unselectedItemColor: Colors.white.withOpacity(0.5),
            selectedItemColor: Colors.white,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.home,
                    size: 20.0,
                  ),
                ),
                label: 'Home',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.search,
                    size: 20.0,
                  ),
                ),
                label: 'Explore',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.location_history,
                    size: 20.0,
                  ),
                ),
                label: 'Places',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.settings,
                    size: 20.0,
                  ),
                ),
                label: 'Settings',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
