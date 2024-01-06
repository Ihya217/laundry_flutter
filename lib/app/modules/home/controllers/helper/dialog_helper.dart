import 'package:flutter/material.dart';

class DialogHelper {
  void logOutDialog(BuildContext context, Function logOut) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi LogOut'),
          content: const Text('Anda yakin ingin keluar dari aplikasi?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                logOut();
              },
              child: const Text('Ya'),
            ),
          ],
        );
      },
    );
  }
}
