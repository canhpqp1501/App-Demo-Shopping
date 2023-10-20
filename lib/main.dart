import 'package:demo_pass_data/router/app_router.dart';

import 'package:demo_pass_data/view/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'view/firebase_option.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
      name: 'canh',
      );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: AppRouterName.splash,
        onGenerateRoute: AppRouter.onGenerateRoute,
        // truyền từ appRouter qua
        debugShowCheckedModeBanner: false,
        title: 'Flutter Shopping',
        theme: ThemeData.dark().copyWith(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 147, 229, 250),
            brightness: Brightness.dark,
            surface: const Color.fromARGB(255, 237, 239, 241),
          ),
          // scaffoldBackgroundColor: const Color(0xFFFfffff),
        ),
        home: const SplashCreen());
  }
}
