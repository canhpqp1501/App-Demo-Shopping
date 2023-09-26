import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userNameController = TextEditingController();
  final passWordController = TextEditingController();
  String? userwordError;
  String? passwordError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 33, top: 60),
                child: Text(
                  "Welcome Back",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF3F414E)),
                ),
              ),
            ),
            SizedBox(
              width: 374,
              height: 63,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF8E97FD)),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/fb.png",
                    ),
                    const SizedBox(
                      width: 45,
                    ),
                    const Text(
                      'CONTINUE WITH FACEBOOK',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFF6F1FB)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 374,
              height: 63,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xffffffff)),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/gg.png",
                    ),
                    const SizedBox(
                      width: 45,
                    ),
                    const Text(
                      'CONTINUE WITH GOOGLE',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF3F414E)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "ĐĂNG NHẬP EMAIL",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFA1A4B2)),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.only(left: 18, right: 18),
              child: TextField(
                controller: userNameController,
                onChanged: (value) {},
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.mail,
                      color: Color(0xFFA1A4B2),
                    ),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 192, 203, 249),
                  hintText: 'Nhập Email',
                  hintStyle: const TextStyle(color: Color(0xFFA1A4B2)),
                  suffixIcon: IconButton(
                      onPressed: () {
                        userNameController.clear();
                      },
                      icon: const Icon(Icons.clear)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: userwordError != null
                        ? const BorderSide(
                            color: Color.fromARGB(255, 244, 244, 244),
                          )
                        : BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.only(left: 18, right: 18),
              child: TextField(
                controller: passWordController,
                onChanged: (value) {},
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.mail,
                      color: Color(0xFFA1A4B2),
                    ),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 192, 203, 249),
                  hintText: 'Nhập password ',
                  hintStyle: const TextStyle(color: Color(0xFFA1A4B2)),
                  suffixIcon: IconButton(
                      onPressed: () {
                        passWordController.clear();
                      },
                      icon: const Icon(Icons.clear)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: passwordError != null
                        ? const BorderSide(
                            color: Color.fromARGB(255, 244, 244, 244),
                          )
                        : BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
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
                  'ĐĂNG NHẬP',
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
            const Text(
              "Quên mật khẩu?",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF3F414E)),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('bạn chưa có tài khoản?',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFA1A4B2))),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Đăng Kí",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF8E97FD)),
                    ))
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
