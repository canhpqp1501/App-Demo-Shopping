// ignore_for_file: unused_local_variable, use_build_context_synchronously, non_constant_identifier_names

import 'package:demo_pass_data/user_auth/authentication.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigUpShopping extends StatefulWidget {
  const SigUpShopping({super.key});

  @override
  State<SigUpShopping> createState() => _SigUpShoppingState();
}

class _SigUpShoppingState extends State<SigUpShopping> {
  final Auth _auth = Auth();
  final _emailNameController = TextEditingController();
  final _userNameController = TextEditingController();
  final _passWordController = TextEditingController();
  bool isChesk = false;
  String? userwordError;
  String? passwordError;
  SharedPreferences? Prefs;

  @override
  void dispose() {
    _emailNameController.dispose();
    _userNameController.dispose();
    _passWordController.dispose();
    super.dispose();
  }

  void sharedPreferences() async {
    Prefs = await SharedPreferences.getInstance();
  }

  void sigUpHandle() async {
    String email = _emailNameController.text.trim();
    String userName = _userNameController.text.trim();
    String pass = _passWordController.text.trim();

    User? user =
        await _auth.siginWithEmailAndPassword(email: email, password: pass);
    if (user == null) {
      Navigator.pushNamed(context, "/home");
    }
  }
  // cho vào màn widget_tree để test

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 330),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                // cmt lại pop
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 33, top: 15),
                child: Text(
                  "Create your account ",
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
              "ĐĂNG KÍ EMAIL",
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
                style: const TextStyle(color: Color(0xff000000)),
                controller: _userNameController,
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
                  fillColor: const Color(0xffF2F3F7),
                  hintText: 'Nhập Họ & Tên',
                  hintStyle: const TextStyle(color: Color(0xFFA1A4B2)),
                  suffixIcon: IconButton(
                      onPressed: () {
                        _userNameController.clear();
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
                style: const TextStyle(color: Color(0xff000000)),
                controller: _emailNameController,
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
                  fillColor: const Color(0xffF2F3F7),
                  hintText: 'Nhập Email',
                  hintStyle: const TextStyle(color: Color(0xFFA1A4B2)),
                  suffixIcon: IconButton(
                      onPressed: () {
                        _emailNameController.clear();
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
                style: const TextStyle(color: Color(0xff000000)),
                controller: _passWordController,
                onChanged: (value) {},
                obscureText: !isChesk,
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
                  fillColor: const Color(0xffF2F3F7),
                  hintText: 'Nhập password ',
                  hintStyle: const TextStyle(color: Color(0xFFA1A4B2)),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        isChesk = !isChesk;
                      });
                    },
                    child: Icon(
                      isChesk ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
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
                onPressed: () {
                  sigUpHandle();
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
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }
}
