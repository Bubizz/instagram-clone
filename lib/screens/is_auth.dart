import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram/screens/check_inbox.dart';
import 'package:instagram/screens/sign_in.dart';
import 'package:instagram/screens/sing_up.dart';
import '../services/auth_methods.dart';

class IsAuth extends StatefulWidget {
  const IsAuth({Key? key}) : super(key: key);

  @override
  State<IsAuth> createState() => _IsAuthState();
}

class _IsAuthState extends State<IsAuth> {
  bool _showSignIn = true;
  Timer? timer;



  void toogleView() {
    setState(() {
      _showSignIn = !_showSignIn;
    });
  }

 

  void listenToEmailVerification() {
    timer = Timer.periodic(const Duration(seconds: 6), (timer) {
      AuthMethods().currentUser.reload();
      if (AuthMethods().currentUser.emailVerified) {
        setState(() {});
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: null,
        stream: AuthMethods().auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            timer?.cancel();
            return _showSignIn
                ? LoginScreen(
                    goToSignUp: toogleView,
                  )
                : SignUpScreen(
                    goToSignIn: toogleView,
                  );
          } else if ((snapshot.data as User).emailVerified) {
            timer?.cancel();
            return Text("authethicated");
          } else {
            var user = snapshot.data as User;
            user.sendEmailVerification().then((_) {
              listenToEmailVerification();
            });
            return CheckInbox(
              email: user.email!,
            );
          }
        });
  }
}
