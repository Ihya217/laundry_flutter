import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:laundry_flutter/app/controller/user_data_controller.dart';
import 'package:laundry_flutter/app/modules/home/controllers/home_controller.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final UserDataController userDataController = Get.put(UserDataController());
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.primaryColor,
      appBar: AppBar(
        backgroundColor: Get.theme.primaryColor,
        title: Text(
          'Profil',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage(
                  'assets/images/user_image.jpg'), // Ganti dengan gambar pengguna
            ),
            const SizedBox(height: 10.0),
            Obx(() => Text(
                  userDataController.name.value,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                )),
            const SizedBox(height: 0.0),
            Obx(() => Text(
                  userDataController.email.value,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                )),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                homeController.logOutDialog(context);
              },
              child: const Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}
