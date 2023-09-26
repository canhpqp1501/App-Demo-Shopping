import 'package:demo_pass_data/view/sigin.dart';
import 'package:flutter/material.dart';

class LoginShopping extends StatefulWidget {
  const LoginShopping({super.key});

  @override
  State<LoginShopping> createState() => _LoginShoppingState();
}

class _LoginShoppingState extends State<LoginShopping> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              height: 85,
            ),
            SizedBox(
              width: 374,
              height: 63,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF8E97FD)),
                onPressed: () {},
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
              height: 20,
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
                const SizedBox(
                  width: 10,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SiginShopping()));
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
