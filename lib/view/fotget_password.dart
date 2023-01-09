import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whattoexpect/packages.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Password'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(label: Text('Enter your E-mail')),
              ),
              SizedBox(
                height: 20,
              ),
              Button(
                text: 'Verify',
                color: Colors.white,
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
