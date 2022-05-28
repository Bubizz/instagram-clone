
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:instagram/screens/is_auth.dart';


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
       scaffoldBackgroundColor: const Color.fromARGB(158, 48, 47, 47),
       canvasColor: const Color.fromARGB(0, 0, 0, 0),
       textTheme: TextTheme(
         bodyLarge: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
         bodyMedium: TextStyle(color: Colors.blue[600]),
         
         
       )
     ),
     routes: {"isauth" : (_) => const IsAuth(),
     
     },
     initialRoute: "isauth",
   );
}
}