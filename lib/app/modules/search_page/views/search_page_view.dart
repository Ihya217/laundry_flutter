import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_page_controller.dart';

class SearchPageView extends GetView<SearchPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.primaryColor,
        title: Text(
          'Lokasi Cabang',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildSearchField(),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Get.theme.primaryColor,
                  ),
                  onPressed: () {
                    controller.getSearchCity();
                  },
                  child: Icon(Icons.search),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildSearchResults(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: controller.searchController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 4.0),
        hintText: 'Cari Kota',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }

  Widget _buildSearchResults() {
    return Expanded(
      child: Obx(
        () => ListView.builder(
          itemCount: controller.searchCityModel.value.data?.length ?? 0,
          itemBuilder: (context, index) {
            var data = controller.searchCityModel.value.data![index];
            return Card(
              elevation: 3, // Ubah nilai ini sesuai keinginan
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: ListTile(
                title: Text(data.name ?? ''),
                subtitle: Text(data.location ?? ''),
                leading: CircleAvatar(
                  // Tambahkan gambar atau icon di sini
                  child: Icon(Icons.location_city),
                ),
                onTap: () {
                  Get.snackbar('Item Selected', data.name ?? '',
                      snackPosition: SnackPosition.BOTTOM);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
