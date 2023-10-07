import 'package:demo_pass_data/view/login.dart';
import 'package:demo_pass_data/widget/grocety_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const  GrocetyList();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
