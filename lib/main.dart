
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/login.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     theme: ThemeData.dark().copyWith(
       scaffoldBackgroundColor: Color.fromARGB(158, 48, 47, 47),
       textTheme: TextTheme(
         
         bodyMedium: TextStyle(color: Colors.blue[600])
       )
     ),
     routes: {"login" : (_) => const LoginScreen(),
     
     },
     initialRoute: "login",
   );
}
}