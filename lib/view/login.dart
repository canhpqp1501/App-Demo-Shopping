// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:demo_pass_data/user_auth/authentication.dart';
import 'package:demo_pass_data/view/sigup.dart';
import 'package:demo_pass_data/widget/grocety_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = Auth();
  final _emailController = TextEditingController();
  final _passWordController = TextEditingController();
  String? userwordError;
  String? passwordError;
  bool isChesk = false;
  SharedPreferences? prefs;
  @override
  void initState() {
    sharedPreferences();
    super.initState();
  }

  void sharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    // print(loginData);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passWordController.dispose();
    super.dispose();
  }

  Future<void> loginHandle() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passWordController.text,
    );
    await prefs?.setString("loginData", _emailController.text);

    // showw dialog

    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: Color(0xFF8E97FD),
          ),
        );
      },
    );

    ///
    if (_emailController.text == "" || _passWordController.text == "") {
      final snackBar = SnackBar(
        backgroundColor: const Color(0xffBC7AF9),
        content: const Text(
          "Vui lòng nhập email và password",
          style: TextStyle(color: Color(0xffffffff)),
          // style: AppStyle.textBodyScaffoldBigType4BlackSlim,
        ),
        action: SnackBarAction(
          label: "Thoát",
          textColor: const Color(0xffffffff),
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    // await Auth().loginWithEmailAndPassword(
    //     email: _emailController.text.trim(),
    //     password: _passWordController.text.trim());

    /// xử lý lỗi
    ///
    String email = _emailController.text.trim();
    String pass = _passWordController.text.trim();

    User? userlogin =
        await _auth.loginWithEmailAndPassword(email: email, password: pass);
    if (userlogin == null) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const GrocetyList()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Center(
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
                  style: const TextStyle(color: Color(0xff000000)),
                  controller: _emailController,
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
                          _emailController.clear();
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
                    loginHandle();
                    //
                    //   if (_emailController.text.isNotEmpty &&
                    //       _passWordController.text.isNotEmpty) {
                    //     setState(() {
                    //       final snackbar = SnackBar(
                    //         backgroundColor: const Color(0xffBC7AF9),
                    //         content: const Text(
                    //           "Sai tài khoản hoặc mật khẩu",
                    //         ),
                    //         action: SnackBarAction(
                    //             label: "Thoát",
                    //             textColor: const Color(0xffffffff),
                    //             onPressed: () {}),
                    //       );
                    //       ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    //     });
                    //   } else {
                    //     setState(() {
                    //       userwordError = null;
                    //       passwordError = null;
                    //     });
                    //   }
                  },
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
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SigUpShopping(),
                        ));
                      },
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
      ),
    );
  }
}
