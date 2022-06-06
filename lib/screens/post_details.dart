

import 'package:flutter/material.dart';
import 'package:instagram/models/post.dart';
import 'package:instagram/services/db_methods.dart';
import '../services/auth_methods.dart';

class PostDetails extends StatefulWidget {
  PostDetails({Key? key, required this.post, this.username}) : super(key: key);

  Post post;

  String? username;

  

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  late bool isLiked;

  @override
  void initState() {
    isLiked = widget.post.likes.contains(AuthMethods().currentUser.uid);
    print(isLiked);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Row(children: [CircleAvatar(radius: 15,backgroundColor: Colors.yellowAccent) , Text(widget.username ?? "...", style: TextStyle(color: Colors.white),)],),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: double.infinity, maxHeight: height * 0.65),
            child: FittedBox(
               fit: BoxFit.cover,
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                widget.post.imageUrl,
               
              
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Row(
                children: [
               
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isLiked = !isLiked;
                        });
                        dbMethods().likePost(widget.post.postID, AuthMethods().currentUser.uid ); 
                      },
                      icon: isLiked ? Icon(Icons.favorite, color: Colors.red,) : Icon(Icons.favorite_border_outlined, )),
                

                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.mode_comment_outlined)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.telegram)),
                ],
              ),
              Text("${widget.post.likes.length} likes", style: const TextStyle(color: Colors.white),),
              Text("${widget.username} ${widget.post.description}" , style: const TextStyle(color: Colors.white))
            ]),
          )
        ],
      ),
    );
  }
}
