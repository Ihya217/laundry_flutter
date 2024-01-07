import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:laundry_flutter/app/data/models/search_city_model.dart';
import 'package:laundry_flutter/app/data/provider/app_services_manager.dart';

class SearchPageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  final Rx<SearchCityModel> searchCityModel = SearchCityModel().obs;
  final TextEditingController searchController = TextEditingController();
  final RxList<String> searchResults = <String>[].obs;
  RxBool isLoading = false.obs;

  Future<void> getSearchCity() async {
    isLoading.value = true;
    String city = searchController.text;
    try {
      SearchCityModel searchCityResponse =
          await AppServiceManager.getSearchCity(city);
      List<SearchCityData>? searchCityData = searchCityResponse.data;

      if (searchCityData != null) {
        searchCityModel.value = SearchCityModel(data: searchCityData);
      }
    } catch (e) {
      print("Terjadi kesalahan saat mengambil data: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
