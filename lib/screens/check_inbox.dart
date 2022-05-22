import 'package:flutter/material.dart';
import 'package:instagram/services/auth_methods.dart';

class CheckInbox extends StatelessWidget {
  CheckInbox({ Key? key, required this.email,}) : super(key: key);
  
  String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Column(
          children: [
            TextButton(onPressed: () {AuthMethods().signout();}, child: Text("logout ")),
            ColorFiltered(child: Image.asset('assets/envelop-email.png', ), colorFilter: const ColorFilter.mode(Colors.white, BlendMode.color),),
            Text('Enter the link we sent to ${email}', style: Theme.of(context).textTheme.bodyLarge,),
          


          ],
        ),
      ),
    );
  }
}