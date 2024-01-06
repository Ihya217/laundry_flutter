import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/register_page_controller.dart';

class RegisterPageView extends GetView<RegisterPageController> {
  const RegisterPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final RegisterPageController registerPageController =
        Get.put(RegisterPageController());
    double screenWidth = MediaQuery.of(context).size.width;

    return Obx(() {
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
                  'Silahkan Daftar!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: controller.usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: controller.emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.mail),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Obx(() {
                    return TextField(
                      controller: controller.passwordController,
                      obscureText: !controller.showPassword.value,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(controller.showPassword.value
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            controller.toggleShowPassword();
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
                      controller.register();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Get.theme.primaryColor,
                    ),
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator(
                            color: Colors.white, // Ubah warna sesuai kebutuhan
                          )
                        : Text(
                            'Daftarkan!',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              height: 1.5,
                              color: const Color(0xffffffff),
                            ),
                          ),
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
    });
  }
}
