import 'package:flutter/material.dart';

class UserListTile extends StatelessWidget {
 UserListTile({ Key? key, required this.username, required this.fullname }) : super(key: key);
  String username;
  String fullname;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const CircleAvatar(backgroundImage: NetworkImage('https://unitycharity.com/wp-content/uploads/2015/09/wallpaper-for-facebook-profile-photo-1.jpg'), radius: 30, ),
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(username), Text(fullname) ]),
    );}
}