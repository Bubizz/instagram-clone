import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram/services/auth_methods.dart';
import 'package:provider/provider.dart';
class Profile extends StatelessWidget {
  const Profile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: 
            [
              Text(Provider.of<User>(context).displayName!, style: Theme.of(context).textTheme.bodyLarge,), 
              IconButton(onPressed: () {}, icon: const Icon(Icons.add_box_outlined))
            ],),
            Row(
              children: 
            [
              Column(
                children: [
                  CircleAvatar(backgroundImage: NetworkImage(Provider.of<User>(context).photoURL ?? 'https://unitycharity.com/wp-content/uploads/2015/09/wallpaper-for-facebook-profile-photo-1.jpg',),   radius: 46.0, ),
                  const SizedBox(height: 10,),
                  Text("mikołaj")
                ],
                
              ),
              const Spacer(flex: 2,),
              Column(children: [
                Text("0", style: Theme.of(context).textTheme.bodyLarge),
                Text("Posty")
              ],),
               const Spacer(flex: 1,),
               Column(children: [
                Text("0", style: Theme.of(context).textTheme.bodyLarge,),
                Text("Obserwu...")
              ],),
                const Spacer(flex: 1,),
               Column(children: [
                Text("0", style: Theme.of(context).textTheme.bodyLarge),
                Text("Obserwu...")
              ],)
            ],),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () {AuthMethods().signout();}, child: const Text("Edit profile"), style: ElevatedButton.styleFrom(side: const BorderSide(color: Colors.grey)))
              )
          
            
            
            
            ]
          
        ),
      ),
    );
      
      
    
  }
}