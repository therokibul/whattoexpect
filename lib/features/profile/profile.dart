import 'package:flutter/material.dart';
import 'package:whattoexpect/repository/authentication_repository/authentication_repository.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
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
                  const ListTile(
                    title: Text('Name'),
                    trailing: Text('Aishwariya Farahi'),
                  ),
                  const ListTile(
                    title: Text('Due Date'),
                    trailing: Text('15-sep-2023'),
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
  }
}
