import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:laundry_flutter/app/modules/home/views/home_view.dart';
import 'package:laundry_flutter/app/utils/custom_input_decoration.dart';

import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextStyle titleLarge = Theme.of(context).textTheme.titleLarge!;
    final TextStyle titleSmall = Theme.of(context).textTheme.titleSmall!;
    final TextStyle labelSmall = Theme.of(context).textTheme.labelSmall!;

    return Obx(() {
      if (controller.isLoggedIn.value) {
        return HomeView();
      } else {
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
                                    'Masuk',
                                    style: titleLarge,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Gunakan Akun Laundry App',
                                    style: titleSmall,
                                  ),
                                ),
                              ),
                              SizedBox(height: 3),
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
                              SizedBox(height: 3),
                              TextField(
                                controller: controller.usernameController,
                                decoration:
                                    customInputDecoration('Masukkan Email'),
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 5),
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
                              SizedBox(height: 5),
                              TextField(
                                  decoration: customInputDecoration(
                                      'Masukkan Password'),
                                  obscureText: !controller.showPassword.value,
                                  controller: controller.passwordController,
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Belum Punya Akun? ',
                            style: titleSmall,
                          ),
                          InkWell(
                            onTap: () {
                              controller.toRegisterPage();
                            },
                            child: Text(
                              'Registrasi',
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
                            controller.login();
                          },
                          style: ElevatedButton.styleFrom(),
                          child: controller.isLoading.value
                              ? const CircularProgressIndicator(
                                  color: Colors
                                      .white, // Ubah warna sesuai kebutuhan
                                )
                              : Text('Login',
                                  style:
                                      Theme.of(context).textTheme.labelLarge),
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
            // body: Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   child: SingleChildScrollView(
            //     child: Column(children: [
            //       const SizedBox(height: 20),
            //       Align(
            //         alignment: Alignment.topLeft,
            //         child: Text('Masuk',
            //             style: Theme.of(context).textTheme.titleLarge),
            //       ),
            //       const SizedBox(height: 20),
            //       TextField(
            //         controller: loginController.usernameController,
            //         style: Theme.of(context).textTheme.bodyMedium,
            //         decoration: const InputDecoration(
            //           labelText: 'Email',
            //           prefixIcon: Icon(Icons.person),
            //         ),
            //       ),
            //       const SizedBox(height: 10),
            //       Obx(() {
            //         return TextField(
            //           style: Theme.of(context).textTheme.bodyMedium,
            //           controller: loginController.passwordController,
            //           obscureText: !loginController.showPassword.value,
            //           decoration: InputDecoration(
            //             labelText: 'Password',
            //             prefixIcon: const Icon(Icons.lock),
            //             suffixIcon: IconButton(
            //               icon: Icon(loginController.showPassword.value
            //                   ? Icons.visibility_off
            //                   : Icons.visibility),
            //               onPressed: () {
            //                 loginController.toggleShowPassword();
            //               },
            //             ),
            //           ),
            //         );
            //       }),
            //       const SizedBox(height: 20),
            //       Container(
            //         width: double.infinity,
            //         child: ElevatedButton(
            //           onPressed: () {
            //             loginController.login();
            //           },
            //           style: ElevatedButton.styleFrom(),
            //           child: loginController.isLoading.value
            //               ? const CircularProgressIndicator(
            //                   color:
            //                       Colors.white, // Ubah warna sesuai kebutuhan
            //                 )
            //               : Text('Login',
            //                   style: Theme.of(context).textTheme.labelLarge),
            //         ),
            //       ),
            //       Center(
            //         child: TextButton(
            //           onPressed: () {
            //             controller.toRegisterPage();
            //           },
            //           child: Text(
            //             'Daftar?',
            //             style: GoogleFonts.poppins(),
            //           ),
            //         ),
            //       ),
            //     ]),
            //   ),
            // ),
          ),
        );
      }
    });
  }
}
