import 'package:get/get.dart';

import '../controllers/pesanan_details_controller.dart';

class PesananDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PesananDetailsController>(
      () => PesananDetailsController(),
    );
  }
}
