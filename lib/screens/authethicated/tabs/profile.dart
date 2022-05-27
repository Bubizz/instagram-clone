import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram/services/auth_methods.dart';
import 'package:instagram/widgets/my_bottom_sheet.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({ Key? key }) : super(key: key);


  void _addPost(BuildContext context)
  {
        showModalBottomSheet(
          isScrollControlled: true,
            context: context,
            builder: (builder){
              return const MyBottomSheet();
            }
        );   
  }

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
              IconButton(onPressed: () =>  _addPost(context), icon: const Icon(Icons.add_box_outlined))
            ],),
            Row(
              children: 
            [
              Column(
                children: [
                  CircleAvatar(backgroundImage: NetworkImage(Provider.of<User>(context).photoURL ?? 'https://unitycharity.com/wp-content/uploads/2015/09/wallpaper-for-facebook-profile-photo-1.jpg',),   radius: 46.0, ),
                  const SizedBox(height: 10,),
                  Provider.of<String?>(context) == null ? const SizedBox(height: 10, width: 10, child: CircularProgressIndicator(),) : Text(Provider.of<String?>(context, listen: false)!)
                
                ],
                
              ),
              const Spacer(flex: 2,),
              Column(children: [
                Text("0", style: Theme.of(context).textTheme.bodyLarge),
                const Text("Posts")
              ],),
               const Spacer(flex: 1,),
               Column(children: [
                Text("0", style: Theme.of(context).textTheme.bodyLarge,),
                const Text("Followers")
              ],),
                const Spacer(flex: 1,),
               Column(children: [
                Text("0", style: Theme.of(context).textTheme.bodyLarge),
                const Text("Following")
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
/*void _addPost(BuildContext context)
  {
 
        showModalBottomSheet(
            context: context,
            builder: (builder){
              return Container(
                height: 350.0,
                color: Color.fromARGB(0, 0, 0, 0), //could change this to Color(0xFF737373), 
                           //so you don't have to change MaterialApp canvasColor
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(100.0),
                            topRight: const Radius.circular(100.0))),
                    child: new Center(
                      child: new Text("This is a modal sheet"),
                    )),
              );
            }
        );
      
  } */