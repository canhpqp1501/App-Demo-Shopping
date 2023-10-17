// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:demo_pass_data/user_auth/authentication.dart';
import 'package:demo_pass_data/view/welcome_Screen.dart';
import 'package:demo_pass_data/widget/home_main.dart';
import 'package:flutter/material.dart';

class widgetTree extends StatelessWidget {
  const widgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, SnapShotData) {
        if (SnapShotData.hasData) {
          return const HomeMain();
        } else {
          return const WelcomeShopping();
        }
      },
      stream: Auth().authenStateChanes,
    );
  }
}
