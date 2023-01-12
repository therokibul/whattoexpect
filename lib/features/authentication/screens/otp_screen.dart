import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:whattoexpect/common%20widgets/button.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'CO\nDE',
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                const Text(
                  'Varification',
                  style: TextStyle(
                    fontSize: 25,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                const Text(
                  'Enter the verification code sent at email@email.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                OtpTextField(
                  numberOfFields: 6,
                  mainAxisAlignment: MainAxisAlignment.center,
                  fillColor: Colors.black.withOpacity(0.1),
                  filled: true,
                  onSubmit: ((value) {
                    
                  }),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Button(
                      text: 'Next',
                      color: Colors.white,
                      onTap: () {},
                      bgColor: Colors.black),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
