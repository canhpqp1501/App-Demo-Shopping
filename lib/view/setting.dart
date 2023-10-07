import 'package:demo_pass_data/user_auth/authentication.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool isLoading = true;
  void logOutHandle() {
    Auth().logOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                logOutHandle();
              },
            )
          ],
        ),
      ),
    );
  }
}
