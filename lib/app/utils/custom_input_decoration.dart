import 'package:flutter/material.dart';
import 'package:get/get.dart';

InputDecoration customInputDecoration(String hint) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.white.withOpacity(0.1),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Get.theme.primaryColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Get.theme.primaryColor),
    ),
    contentPadding: const EdgeInsets.all(15),
    hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
    hintText: hint,
  );
}
