import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whattoexpect/common%20widgets/button.dart';
import 'package:whattoexpect/features/authentication/screens/last_preriod.dart';

import '../../../constants/text_strings.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    String? name;
    String? phone;
    DateTime selectedDate = DateTime.now();
    DocumentReference<Map<String, dynamic>> users = FirebaseFirestore.instance
        .collection('users')
        .doc(uuid)
        .collection('info')
        .doc('user');
    bool isLoading = false;
    return SafeArea(
      child: Scaffold(
          body: isLoading
              ? const CircularProgressIndicator()
              : SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: Get.height * 0.25,
                              child: const Image(
                                  image: AssetImage('assets/welcome.png'))),
                          Text(
                            'Welcome ',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Text(
                            'Create your profile to start your journey',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextFormField(
                                  controller: nameController,
                                  validator: (value) {
                                    if (value != null) {
                                      return 'Please enter your name';
                                    }
                                    return null;
                                  },
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
                                  controller: phoneController,
                                  validator: (value) {
                                    if (value!.length < 11) {
                                      return 'Phone must be at least 11 characters';
                                    }
                                    return null;
                                  },
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
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Button(
                                      text: 'SIGN UP',
                                      color: Colors.white,
                                      onTap: () async {
                                        await users.set({
                                          'name': nameController.text,
                                          'phone': phoneController.text.trim(),
                                        }).then((value) =>
                                            Get.to(const LastPririodScreen()));

                                        print(nameController.text);
                                        print(phoneController.text.trim());
                                      },
                                      bgColor: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
    );
  }
}
