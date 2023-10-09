// ignore_for_file: unused_local_variable, avoid_print

import 'package:demo_pass_data/view/welcome_Screen.dart';
import 'package:demo_pass_data/widget/grocety_list.dart';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashCreen extends StatefulWidget {
  const SplashCreen({super.key});

  @override
  State<SplashCreen> createState() => _SplashCreenState();
}

class _SplashCreenState extends State<SplashCreen> {
  SharedPreferences? prefs;

  @override
  void initState() {
    requestPermission();
    sharedPreferences();
    super.initState();
  }

  void sharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    final loginData = prefs?.getString("loginData");
    print(loginData);
    if (loginData == null) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const WelcomeShopping(),
        ));
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const GrocetyList(),
        ));
      });
    }
  }

  void requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      // Permission.location,
      Permission.storage,
    ].request();
    if (await Permission.contacts.request().isGranted) {
      sharedPreferences();
    }
  }

  navigatorWelcome() async {
    // await Future.delayed(const Duration(seconds: 3), () {
    //   Navigator.of(context).push(MaterialPageRoute(
    //     builder: (context) => const WelcomeShopping(),
    //   ));
    // });
    // if (mounted) {

    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Color(0xffFAF8F5)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset('assets/images/splash11.png')]),
      ),
    );
  }
}
