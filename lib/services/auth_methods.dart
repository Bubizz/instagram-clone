import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signup(String email, String password) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception("email is already in use");
      }
    } catch (e) {
      rethrow;
    }
  }

  User get currentUser
  {
    return auth.currentUser!;
  }

  Future<void> signin(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email,
              password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future sendEmail(User user) async
  {
    await user.sendEmailVerification();
  }

  void signout() {
    auth.signOut();
  }
}
