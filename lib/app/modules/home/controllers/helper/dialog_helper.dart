import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  void logOutDialog(BuildContext context, Function logOut) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Get.theme.primaryColor,
          title: Text(
            'Konfirmasi Log Out',
            style: Get.theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text('Anda yakin ingin keluar dari aplikasi?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Batal',
                style: Get.theme.textTheme.titleSmall?.copyWith(
                    color: Get.theme.primaryColor, fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                logOut();
              },
              child: Text(
                'Ya',
                style: Get.theme.textTheme.titleSmall?.copyWith(
                    color: Get.theme.primaryColor, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }
}
