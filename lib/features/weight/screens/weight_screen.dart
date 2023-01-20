import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whattoexpect/constants/text_strings.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({super.key});

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  @override
  Widget build(BuildContext context) {
    Timestamp stamp = Timestamp.now();
    DateTime date = stamp.toDate();

    DocumentReference<Map<String, dynamic>> users = FirebaseFirestore.instance
        .collection('users')
        .doc(uuid)
        .collection('wieght')
        .doc();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weight Tracker'),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(uuid)
              .collection('wieght')
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

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                final Timestamp dateCreated = data["date"];
                final DateTime date = dateCreated.toDate();
                return ListTile(
                  title: Text(data['weight'] + ' KG'),
                  subtitle: Text(date.toString()),
                );
              }).toList(),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => Get.bottomSheet(
            SizedBox(
              height: 200,
              child: Column(
                children: [
                  const Text('Add your Weight'),
                  const TextField(),
                  MaterialButton(
                    onPressed: () {
                      users
                          .set({
                            'weight': '28',
                            'date': date,
                          })
                          .then((value) => print(date))
                          .catchError(
                              (error) => print("Failed to add user: $error"));
                    },
                    child: const Text('Add'),
                  )
                ],
              ),
            ),
            backgroundColor: Colors.white)),
        child: Icon(Icons.add),
      ),

      //  IconButton(
      //   color: Colors.green,
      //   onPressed: (() => Get.bottomSheet(
      //       SizedBox(
      //         height: 200,
      //         child: Column(
      //           children: [
      //             const Text('Add your Weight'),
      //             const TextField(),
      //             MaterialButton(
      //               onPressed: () {
      //                 users
      //                     .set({
      //                       'weight': '28',
      //                       'date': date,
      //                     })
      //                     .then((value) => print(date))
      //                     .catchError(
      //                         (error) => print("Failed to add user: $error"));
      //               },
      //               child: const Text('Add'),
      //             )
      //           ],
      //         ),
      //       ),
      //       backgroundColor: Colors.white)),
      //   icon: const Icon(Icons.add),
      // ),
    );
  }
}
