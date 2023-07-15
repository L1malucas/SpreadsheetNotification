import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TestePage extends StatelessWidget {
  const TestePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    String userName = user != null ? user.displayName ?? 'Unknown' : 'Unknown';

    return Scaffold(
      body: Center(
        child: Text('Logged in as: $userName'),
      ),
    );
  }
}
