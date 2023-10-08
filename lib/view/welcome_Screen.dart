// ignore_for_file: file_names

import 'package:demo_shopping/view/login.dart';
import 'package:demo_shopping/view/sigup.dart';
import 'package:flutter/material.dart';

class WelcomeShopping extends StatefulWidget {
  const WelcomeShopping({super.key});

  @override
  State<WelcomeShopping> createState() => _WelcomeShoppingState();
}

class _WelcomeShoppingState extends State<WelcomeShopping> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Column(
          children: [
            Image.asset(
              'assets/images/login1.png',
              width: double.infinity,
              height: 480,
            ),
            const SizedBox(
              height: 35,
            ),
            const Text(
              "Chào mừng bạn đến với chúng tôi",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w700,
                color: Color(0xFF3F414E),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            SizedBox(
              width: 374,
              height: 63,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF8E97FD)),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SigUpShopping()));
                },
                child: const Text(
                  'ĐĂNG KÍ',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFF6F1FB)),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Bạn Đã Có Tài Khoản?",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFA1A4B2)),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: const Text(
                      "Đăng Nhập",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF8E97FD)),
                    ))
              ],
            )
          ],
        ),
      ]),
    );
  }
}
