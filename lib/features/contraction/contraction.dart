import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whattoexpect/common%20widgets/button.dart';
import 'package:whattoexpect/constants/text_strings.dart';

class ContractionScreen extends StatefulWidget {
  const ContractionScreen({super.key});

  @override
  State<ContractionScreen> createState() => _ContractionScreenState();
}

class _ContractionScreenState extends State<ContractionScreen> {
  @override
  Widget build(BuildContext context) {
    DocumentReference<Map<String, dynamic>> users = FirebaseFirestore.instance
        .collection('users')
        .doc(uuid)
        .collection('contraction')
        .doc();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contraction Tracker',
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(uuid)
              .collection('contraction')
              .orderBy('date')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            return Container(
              child: Column(
                children: [
                  Image.asset(
                    'assets/icons/contraction.png',
                    height: Get.height * 0.3,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Button(
                    text: 'Contraction',
                    color: Colors.white,
                    onTap: () {
                      users
                          .set({
                            'date': formattedDate,
                            'time': formattedTime,
                          })
                          .then((value) => print(formattedTime))
                          .catchError((error) => print("$error"));
                    },
                    bgColor: Colors.pink,
                  ),
                  Expanded(
                    child: ListView(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;

                        return ListTile(
                          title: Text(data['time']),
                          subtitle: Text(data['date']),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
