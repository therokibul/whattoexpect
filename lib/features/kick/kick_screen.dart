import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whattoexpect/common%20widgets/button.dart';
import 'package:whattoexpect/constants/text_strings.dart';

class KickScreen extends StatefulWidget {
  const KickScreen({super.key});

  @override
  State<KickScreen> createState() => _KickScreenState();
}

class _KickScreenState extends State<KickScreen> {
  @override
  Widget build(BuildContext context) {
    DocumentReference<Map<String, dynamic>> users = FirebaseFirestore.instance
        .collection('users')
        .doc(uuid)
        .collection('kick')
        .doc();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kick Counter'),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(uuid)
              .collection('kick')
              .orderBy('date')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            return Container(
              child: Column(
                children: [
                  Image.asset(
                    'assets/icons/baby-feet.png',
                    height: Get.height * 0.3,
                  ),
                  Button(
                    text: 'Kick',
                    color: Colors.black,
                    onTap: () {
                      users
                          .set({
                            'date': formattedDate,
                            'time': formattedTime,
                          })
                          .then((value) => print(formattedTime))
                          .catchError((error) => print("$error"));
                    },
                    bgColor: const Color(0xffe3faff),
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
