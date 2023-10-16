import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isLoading = true;
  void logOutHandle() {
    Navigator.pushNamed(context, "/login");
    
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
