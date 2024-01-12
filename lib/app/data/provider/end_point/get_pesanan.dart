import 'package:laundry_flutter/app/data/models/pesanan_model.dart';
import 'package:laundry_flutter/app/data/provider/absensi_provider.dart';

class GetPesanan extends AbsensiProvider {
  Future<PesananModel> getPesanan() async {
    String authToken = userDataController.token.value;
    int userId = userDataController.userId.value;

    String bearerToken = "Bearer $authToken";
    int maxRetry = 100; // Jumlah maksimal percobaan

    for (int retry = 0; retry < maxRetry; retry++) {
      final response = await get("$url" "laundry/user/$userId", headers: {
        "Authorization": bearerToken,
      });

      if (response.statusCode == 200) {
        final responseData = PesananModel.fromJson(response.body);
        return responseData;
      } else if (response.statusCode! >= 400 && response.statusCode! < 500) {
        // Kesalahan sisi client (4xx)
        print(
            "Kesalahan sisi client saat mengambil data. Kode status: ${response.statusCode}");
        print('laundry/user/$userId');
        // Anda dapat menampilkan pesan kesalahan khusus untuk kesalahan sisi client
        throw Exception("Kesalahan sisi client saat mengambil data");
      } else if (response.statusCode! >= 500 && response.statusCode! < 600) {
        // Kesalahan sisi server (5xx)
        print(
            "Kesalahan sisi server saat mengambil . Kode status: ${response.statusCode}");
        print('laundry/user/$userId');
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
