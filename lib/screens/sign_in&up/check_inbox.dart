import 'package:flutter/material.dart';
import 'package:instagram/services/auth_methods.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckInbox extends StatelessWidget {
  CheckInbox({ Key? key, required this.email,}) : super(key: key);
  
  String email;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(child: SvgPicture.asset("assets/email.svg", color: const Color.fromARGB(244, 249, 230, 253),), height: 130,),
            const SizedBox(height: 20,),
            Text('Enter the link we sent to ', style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 26, color: const Color.fromARGB(255, 233, 180, 197), fontWeight: FontWeight.normal)),
            Center(child: Text(email, style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 26, color: const Color.fromARGB(255, 233, 180, 197), fontWeight: FontWeight.bold))),
            const Spacer(flex: 1,),
            Text('This page will reload automatically after email verification',  style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white, fontSize: 17)),
            const Spacer(flex: 2,),
            ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.blueGrey)  , onPressed: () {AuthMethods().signout();}, child: const Text("I will verify my email later"), ),
             Text('You can sign in later and complete verification process',  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white)),
            const Spacer(flex: 3,),
    
          
    
    
          ],
        ),
      ),
    );
  }
}