// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:laundry_flutter/app/controller/user_data_controller.dart';

class AbsensiProvider extends GetConnect {
  final String url = "http://192.168.0.121:8001/api/";
  UserDataController userDataController = Get.find<UserDataController>();
}
