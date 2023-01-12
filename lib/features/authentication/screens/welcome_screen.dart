import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:whattoexpect/constants/colors.dart';
import 'package:whattoexpect/constants/text_strings.dart';
import 'package:whattoexpect/features/authentication/screens/login_screen.dart';
import 'package:whattoexpect/features/authentication/screens/signup_screen.dart';

import '../../../common widgets/button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),

                SizedBox(
                  width: double.infinity,
                  height: Get.height * 0.5,
                  child: Lottie.asset('assets/animation/pregnant_women.json'),
                ),

                // SizedBox(
                //   height: Get.height * 0.15,
                // ),

                const Text(
                  appTitle,
                  textScaleFactor: 2,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: Get.width * 0.7,
                  child: const Text(
                    'Track your Pregnancy, take care your health, your baby, stay safe and count your days until birth.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.1,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Button(
                        text: 'Login',
                        color: Colors.white,
                        onTap: () {
                          Get.off(const LoginScreen());
                        },
                        bgColor: Colors.pink,
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.05,
                    ),
                    Button(
                      text: 'Signup',
                      color: Colors.white,
                      onTap: () {
                        Get.off(const SignUpScreen());
                      },
                      bgColor: darkColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
