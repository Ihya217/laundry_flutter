import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/register_page_controller.dart';
import 'dart:ui';

import 'package:laundry_flutter/app/modules/home/views/home_view.dart';
import 'package:laundry_flutter/app/utils/custom_input_decoration.dart';

class RegisterPageView extends GetView<RegisterPageController> {
  const RegisterPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final RegisterPageController registerPageController =
        Get.put(RegisterPageController());
    double screenWidth = MediaQuery.of(context).size.width;
    final TextStyle titleLarge = Theme.of(context).textTheme.titleLarge!;
    final TextStyle titleSmall = Theme.of(context).textTheme.titleSmall!;
    final TextStyle labelSmall = Theme.of(context).textTheme.labelSmall!;

    return Obx(() {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          backgroundColor: Get.theme.primaryColor,
          body: SingleChildScrollView(
            child: Stack(children: [
              Image.asset("assets/images/header_started.png"),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 170,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Get.theme.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 0,
                            blurRadius: 1,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 20, 25, 25),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Daftar',
                                  style: titleLarge,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Daftarkan Akun Laundry App',
                                  style: titleSmall,
                                ),
                              ),
                            ),
                            const SizedBox(height: 3),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Username',
                                  style: labelSmall,
                                ),
                              ),
                            ),
                            TextField(
                              style: TextStyle(color: Colors.white),
                              controller: controller.usernameController,
                              decoration:
                                  customInputDecoration('Masukkan Username'),
                            ),
                            const SizedBox(height: 3),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Email',
                                  style: labelSmall,
                                ),
                              ),
                            ),
                            const SizedBox(height: 3),
                            TextField(
                              style: TextStyle(color: Colors.white),
                              controller: controller.emailController,
                              decoration:
                                  customInputDecoration('Masukkan Email'),
                            ),
                            const SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Password',
                                  style: labelSmall,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextField(
                              style: TextStyle(color: Colors.white),
                              decoration:
                                  customInputDecoration('Masukkan Password'),
                              obscureText: !controller.showPassword.value,
                              controller: controller.passwordController,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sudah Punya Akun? ',
                          style: titleSmall,
                        ),
                        InkWell(
                          onTap: () {
                            Get.offAllNamed('/login-page');
                          },
                          child: Text(
                            'Login',
                            style: titleSmall.copyWith(
                                color: Get.theme.highlightColor,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.register();
                        },
                        style: ElevatedButton.styleFrom(),
                        child: controller.isLoading.value
                            ? const CircularProgressIndicator(
                                color:
                                    Colors.white, // Ubah warna sesuai kebutuhan
                              )
                            : Text('Daftarkan',
                                style: Theme.of(context).textTheme.labelLarge),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Copyright by Laundry App',
                      style: titleSmall,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      );
    });
  }
}
