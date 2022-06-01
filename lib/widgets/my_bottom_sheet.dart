import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:instagram/screens/authethicated/new_post/image_gallery_picker.dart';
import 'package:instagram/services/auth_methods.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({Key? key, }) : super(key: key);


  Future _pickImage(context) async 
  {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return MediaGrid();
    }));
 
    /*var time = DateTime.now().millisecondsSinceEpoch.toString();
    final ref = FirebaseStorage.instance
          .ref('posts')
          .child(AuthMethods().currentUser.uid).child(time).child(image.name);
    await ref.putFile(File(image.path));
    String url = (await ref.getDownloadURL()).toString();
    print(url);*/

    

   

    
    
  


  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.65,
        decoration: const BoxDecoration(
            color: Color.fromARGB(248, 61, 60, 60),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 30,
                height: 8,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(10), right: Radius.circular(10))),
              ),
            ),
            Text('Create', style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),),
            const Divider(
              color: Color.fromARGB(255, 197, 197, 197),
              thickness: 1,
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: const Color.fromRGBO(66, 66, 66, 1),
                onTap: () => _pickImage(context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Row(children: [
                    const Icon(
                      Icons.grid_view,
                    ),
                    const Spacer(flex: 1,),
                    Text("Post", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white, fontSize: 18),),
                    const Spacer(flex: 9,),
                  ]),
                ),
              ),
            ),
            const Divider(
                indent: 20, endIndent: 20, color: Color.fromARGB(255, 197, 197, 197), thickness: 1)
          ],
        ));
  }
}
