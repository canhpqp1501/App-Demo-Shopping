import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authenStateChanes => _firebaseAuth.authStateChanges();
  loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  siginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}

// class AuthPage extends StatelessWidget {
//   const AuthPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder(
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return const GrocetyList();
//           } else {
//             return const LoginScreen();
//           }
//         },
//         stream: FirebaseAuth.instance.authStateChanges(),
//       ),
//     );
//   }
// }
