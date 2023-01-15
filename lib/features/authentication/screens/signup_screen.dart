import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whattoexpect/common%20widgets/button.dart';
import 'package:whattoexpect/constants/text_strings.dart';
import 'package:whattoexpect/features/authentication/controllers/signup_controller.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();
    final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

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
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                'Create your profile to start your journey',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextFormField(
                        // controller: controller.fullName,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_outline_outlined,
                          ),
                          labelText: 'Full Name',
                          hintText: 'Full Name',
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: _emailController,
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
                        // controller: controller.phoneNumber,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.numbers,
                          ),
                          labelText: 'Phone Number',
                          hintText: 'Phone Number',
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: _passwordController,
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
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              // if (formKey.currentState!.validate()) {
                              //   SignUpController.instance.registerUser(
                              //       controller.email.text.trim(),
                              //       controller.password.text.trim());
                              // }
                            },
                            child: const Text('Forget Password?')),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Button(
                            text: 'SIGN UP',
                            color: Colors.white,
                            onTap: () {
                              authController.register(_emailController.text.trim(),
                      _passwordController.text.trim());
                            },
                            bgColor: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text.rich(
                  TextSpan(
                      text: 'Already have an Account? ',
                      style: Theme.of(context).textTheme.bodyText2,
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
