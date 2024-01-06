import 'package:laundry_flutter/app/data/provider/absensi_provider.dart';

class PostRegister extends AbsensiProvider {
  Future<dynamic> postRegister(
      String username, String email, String password) async {
    final response = await post("$url" "register", {
      "username": username,
      "email": email,
      "password": password,
    });
    return response.body;
  }
}
