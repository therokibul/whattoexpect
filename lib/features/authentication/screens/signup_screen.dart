import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whattoexpect/common%20widgets/button.dart';
import 'package:whattoexpect/constants/text_strings.dart';
import 'package:whattoexpect/features/authentication/screens/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();

    final TextEditingController passwordController = TextEditingController();
    DateTime selectedDate = DateTime.now();

    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  height: Get.height * 0.25,
                  child: const Image(image: AssetImage('assets/welcome.png'))),
              Text(
                'Welcome ',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                'Create your profile to start your journey',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.mail_outlined,
                          ),
                          labelText: 'E-Mail',
                          hintText: 'E-Mail',
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.password,
                          ),
                          labelText: 'Password',
                          hintText: 'Password',
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Button(
                            text: 'NEXT',
                            color: Colors.white,
                            onTap: () async {
                              authController.register(
                                  emailController.text.trim(),
                                  passwordController.text.trim());
                            },
                            bgColor: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.to(const LoginScreen());
                },
                child: Text.rich(
                  TextSpan(
                      text: 'Already have an Account? ',
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: const [
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ]),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
