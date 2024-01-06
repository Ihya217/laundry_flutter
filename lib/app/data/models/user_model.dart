import 'package:laundry_flutter/app/data/models/user_data.dart';

class UserModel {
  UserData data;
  String token;

  UserModel({
    required this.data,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      data: UserData.fromJson(json['data']),
      token: json['token'],
    );
  }
}
