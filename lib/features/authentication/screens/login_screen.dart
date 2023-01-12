import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whattoexpect/common%20widgets/button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  height: Get.height * 0.3,
                  child: const Image(image: AssetImage('assets/welcome.png'))),
              Text(
                'Welcome Back',
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                'Welcome Back',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Form(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person_outline_outlined),
                            labelText: 'E-Mail',
                            hintText: 'E-Mail',
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.fingerprint),
                            labelText: 'Password',
                            hintText: 'Password',
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.remove_red_eye_outlined),
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: const Text('Forget Password?')),
                      ),
                      Button(
                          text: 'LOGIN',
                          color: Colors.white,
                          onTap: () {},
                          bgColor: Colors.black)
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text.rich(
                  TextSpan(
                      text: 'Don\'t have an Account? ',
                      style: Theme.of(context).textTheme.bodyText2,
                      children: const [
                        TextSpan(
                          text: 'SignUp',
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
