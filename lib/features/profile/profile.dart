import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whattoexpect/constants/text_strings.dart';
import 'package:whattoexpect/repository/authentication_repository/authentication_repository.dart';
import 'package:intl/intl.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(uuid)
              .collection('info')
              .doc('user')
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }
            var data = snapshot.data;
            Timestamp timestamp = data!['lastPeriod'];
            DateTime dateTime = timestamp.toDate();
            DateTime newTime = dateTime.add(const Duration(days: 280));
            var formatter = DateFormat('dd-MM-yyyy');

            String dueDate = formatter.format(newTime);
            return SafeArea(
              child: Center(
                child: Column(
                  children: [
                    Card(
                      child: Column(
                        children: [
                          Text(
                            'Personalization',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          ListTile(
                            title: const Text('name'),
                            trailing: Text(data['name']),
                          ),
                          ListTile(
                            title: const Text('Due Date'),
                            trailing: Text(dueDate),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: const Icon(Icons.logout_outlined),
                        title: const Text('LogOut'),
                        onTap: () {
                          AuthController().signOut();
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}


