import 'package:laundry_flutter/app/data/models/search_city_model.dart';
import 'package:laundry_flutter/app/data/provider/absensi_provider.dart';

class GetSearchCity extends AbsensiProvider {
  Future<SearchCityModel> getSearchCity(String city) async {
    String authToken = userDataController.token.value;
    String bearerToken = "Bearer $authToken";
    int maxRetry = 100; // Jumlah maksimal percobaan

    for (int retry = 0; retry < maxRetry; retry++) {
      final response = await get("$url" "shop/search/city/$city", headers: {
        "Authorization": bearerToken,
      });

      if (response.statusCode == 200) {
        final responseData = SearchCityModel.fromJson(response.body);
        return responseData;
      } else if (response.statusCode! >= 400 && response.statusCode! < 500) {
        // Kesalahan sisi client (4xx)
        print(
            "Kesalahan sisi client saat mengambil . Kode status: ${response.statusCode}");
        print('shop/search/city/$city');
        // Anda dapat menampilkan pesan kesalahan khusus untuk kesalahan sisi client
        throw Exception("Kesalahan sisi client saat mengambil ");
      } else if (response.statusCode! >= 500 && response.statusCode! < 600) {
        // Kesalahan sisi server (5xx)
        print(
            "Kesalahan sisi server saat mengambil . Kode status: ${response.statusCode}");
        print('shop/search/city/$city');
        print('$authToken');
        // Anda dapat menampilkan pesan kesalahan khusus untuk kesalahan sisi server
        throw Exception("Kesalahan sisi server saat mengambil ");
      } else {
        // Kode status lain yang tidak diharapkan
        print(
            "Kesalahan tidak diketahui saat mengambil . Kode status: ${response.statusCode}");
        // Anda dapat menampilkan pesan kesalahan umum atau melakukan tindakan lain sesuai kebutuhan

        // Tunggu sebentar sebelum mencoba lagi
        await Future.delayed(const Duration(seconds: 2));
      }
    }

    // Jika seluruh percobaan gagal, lempar exception
    throw Exception("Gagal mengambil  setelah $maxRetry kali percobaan");
  }
}
