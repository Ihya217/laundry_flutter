import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:laundry_flutter/app/controller/auth_controller.dart';
import 'package:laundry_flutter/app/controller/user_data_controller.dart';
import 'package:laundry_flutter/app/data/models/user_data.dart';
import 'package:laundry_flutter/app/modules/home/controllers/helper/dialog_helper.dart';
import 'package:laundry_flutter/app/modules/home/views/home_view.dart';
import 'package:laundry_flutter/app/modules/profile/views/profile_view.dart';
import 'package:laundry_flutter/app/modules/search_page/views/search_page_view.dart';

class HomeController extends GetxController {
  final AuthController authController = AuthController();
  final DialogHelper dialogHelper = DialogHelper();
  final UserDataController userDataController = Get.put(UserDataController());

  var _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;

  final List<Widget> pages = [
    HomeView(),
    SearchPageView(),
    ProfileView(),
  ];

  void onItemTapped(int index) {
    _selectedIndex.value = index;
  }

  void logOut() {
    authController.logout();
    userDataController.saveUserData(
        UserData(
            id: 0,
            username: '',
            email: '',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            token: ''),
        '');
    Get.offAllNamed('/login-page');
  }

  @override
  void onInit() {
    super.onInit();
  }

  void logOutDialog(BuildContext context) {
    dialogHelper.logOutDialog(context, logOut);
  }
}
