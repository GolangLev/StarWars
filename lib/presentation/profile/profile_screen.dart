import 'package:flutter/material.dart';

class ProfileScreenPage extends StatelessWidget {
  const ProfileScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('profile')),
      ),
    );
  }
}
