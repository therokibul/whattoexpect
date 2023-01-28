import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whattoexpect/common%20widgets/button.dart';
import 'package:intl/intl.dart';

import '../../../constants/text_strings.dart';
import '../../core/screens/home_screen.dart';

class LastPririodScreen extends StatefulWidget {
  const LastPririodScreen({super.key});

  @override
  State<LastPririodScreen> createState() => _LastPririodScreenState();
}

class _LastPririodScreenState extends State<LastPririodScreen> {
  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();

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
                            ' start your journey',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                ListTile(
                                  onTap: (() async {
                                    final DateTime? picked =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2100),
                                    );
                                    if (picked != null) {
                                      setState(() {
                                        selectedDate = picked;
                                        var formatter =
                                            DateFormat('dd-MM-yyyy');
                                        formattedTime = DateFormat('kk:mm:a')
                                            .format(selectedDate);
                                        formattedDate =
                                            formatter.format(selectedDate);
                                      });
                                    }
                                  }),
                                  title: const Text('Last period started'),
                                  trailing: const Icon(
                                    Icons.calendar_month_outlined,
                                    color: Colors.pink,
                                  ),
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
                                        await users.update({
                                          'lastPeriod': selectedDate,
                                        }).then(
                                            (value) => Get.to(const Home()));
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
