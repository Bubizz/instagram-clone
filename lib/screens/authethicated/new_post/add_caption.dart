import 'package:flutter/material.dart';
import 'dart:io';
import '../../../services/auth_methods.dart';

import 'package:instagram/services/db_methods.dart';

class AddImgCaption extends StatelessWidget {
  AddImgCaption({Key? key, required this.image}) : super(key: key);
  final File image;
  final TextEditingController controlText = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New Post",
          style: AppBarTheme.of(context).titleTextStyle,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();

          },
        ),
        actions: [
          Center(
              child: IconButton(
            color: Colors.blue,
            icon: const Icon(Icons.check, color: Colors.blue),
            onPressed: () {
              dbMethods().uploadPost(authorUID: AuthMethods().currentUser.uid, description: controlText.text, imageToSend: image);
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
          ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            SizedBox(
                width: 120,
                height: 150,
                child: Image.file(
                  image,
                  fit: BoxFit.fill,
                )),
            const SizedBox(width: 25,),
            Expanded(
                child: TextField(
              controller: controlText,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey,),
                hintText: 'Write a caption...',
              ),
              maxLines: null,
            )),
       
          ],
        ),
      ),
    );
  }
}
