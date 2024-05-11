import 'package:coders_guide/main.dart';
import '../login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class checkstatus extends StatelessWidget {
  const checkstatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return const MyApp();
        } else {
          return const loginscreen();
        }
      }),
    ));
  }
}
