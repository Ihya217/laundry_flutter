import 'package:laundry_flutter/app/data/provider/absensi_provider.dart';

class PostLogin extends AbsensiProvider {
  Future<dynamic> postLogin(String email, String password) async {
    final response = await post("$url" "login", {
      "email": email,
      "password": password,
    });
    return response.body;
  }
}
