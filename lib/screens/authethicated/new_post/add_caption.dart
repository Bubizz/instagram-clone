import 'package:flutter/material.dart';
import 'dart:typed_data';

class AddImgCaption extends StatelessWidget {
  const AddImgCaption({Key? key, required this.imgBytes}) : super(key: key);
  final Uint8List imgBytes;

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
                child: Image.memory(
                  imgBytes,
                  fit: BoxFit.fill,
                )),
            const SizedBox(width: 25,),
            const Expanded(
                child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey,),
                hintText: 'Write a caption...',
              ),
              maxLines: null,
            ))
          ],
        ),
      ),
    );
  }
}
