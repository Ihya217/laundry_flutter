import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_flutter/app/modules/home/views/home_view.dart';

import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final LoginPageController loginController = Get.put(LoginPageController());
    double screenWidth = MediaQuery.of(context).size.width;
    final LoginPageController homeController = Get.put(LoginPageController());

    return Obx(() {
      if (homeController.isLoggedIn.value) {
        return HomeView();
      } else {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    width: screenWidth,
                    height: 150,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          'assets/images/corak_biru.png',
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Selamat Datang!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: loginController.usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Obx(() {
                      return TextField(
                        controller: loginController.passwordController,
                        obscureText: !loginController.showPassword.value,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(loginController.showPassword.value
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              loginController.toggleShowPassword();
                            },
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: ElevatedButton(
                      onPressed: () {
                        loginController.login();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Get.theme.primaryColor,
                      ),
                      child: loginController.isLoading.value
                          ? const CircularProgressIndicator(
                              color:
                                  Colors.white, // Ubah warna sesuai kebutuhan
                            )
                          : Text(
                              'Login',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                height: 1.5,
                                color: const Color(0xffffffff),
                              ),
                            ),
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        controller.toRegisterPage();
                      },
                      child: Text('Daftar?'),
                    ),
                  ),
                  // TextButton(
                  //   onPressed: () {
                  //     loginController.intentLupaPassword();
                  //     print('Lupa Password');
                  //   },
                  //   child: Text(
                  //     'Lupa Password',
                  //     style: TextStyle(color: Colors.blue[900], fontSize: 15),
                  //   ),
                  // ),
                  Container(
                    width: screenWidth,
                    height: 160,
                    margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          'assets/images/corak_biru_terbalik.png',
                        ),
                      ),
                    ),
                    child: Stack(children: <Widget>[
                      Center(
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                child: Text(
                                  'Copyright LaundryNime.com',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5,
                                    color: const Color(0xffffffff),
                                  ),
                                ),
                              )))
                    ]),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    });
  }
}
