// ignore_for_file: body_might_complete_normally_nullable, constant_identifier_names

import 'package:demo_pass_data/view/login.dart';
import 'package:demo_pass_data/view/setting.dart';
import 'package:demo_pass_data/view/sigup.dart';
import 'package:demo_pass_data/view/splash.dart';
import 'package:demo_pass_data/view/welcome_Screen.dart';
import 'package:demo_pass_data/view/widget_tree.dart';
import 'package:demo_pass_data/widget/home_list.dart';
import 'package:demo_pass_data/widget/home_main.dart';
import 'package:demo_pass_data/widget/new_item.dart';
import 'package:flutter/material.dart';

class AppRouterName {
  static const splash = "/splash";
  static const widget_Tree = '/widget_tree';
  static const login = '/login';
  static const home_main = '/home';
  static const sigUp = '/sigup';
  static const welcome_Screen = '/welcome';
  static const SettingScreen = '/setting';
  static const new_Item = '/newItem';
  static const home_list = '/homelist';
}

class AppRouter {
  static MaterialPageRoute? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterName.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashCreen(),
          settings: settings,
        );
      case AppRouterName.widget_Tree:
        return MaterialPageRoute(
          builder: (context) => const widgetTree(),
          settings: settings,
        );
      case AppRouterName.login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
          settings: settings,
        );
      case AppRouterName.home_main:
        return MaterialPageRoute(
          builder: (context) => const HomeMain(),
          settings: settings,
        );
      case AppRouterName.sigUp:
        return MaterialPageRoute(
          builder: (context) => const SigUpShopping(),
          settings: settings,
        );
      case AppRouterName.welcome_Screen:
        return MaterialPageRoute(
          builder: (context) => const WelcomeShopping(),
          settings: settings,
        );
      case AppRouterName.SettingScreen:
        return MaterialPageRoute(
          builder: (context) => const SettingScreen(),
          settings: settings,
        );
      case AppRouterName.new_Item:
        return MaterialPageRoute(
          builder: (context) => const NewItem(),
          settings: settings,
        );
      case AppRouterName.home_list:
        return MaterialPageRoute(
          builder: (context) => const HomeList(),
          settings: settings,
        );
    }
    return null;
  }
}
