import 'package:flutter/material.dart';
import 'package:instagram/models/app_user.dart';
import 'package:instagram/screens/user_profile.dart';

class UserListTile extends StatelessWidget {
 UserListTile({ Key? key, required this.user}) : super(key: key);
  AppUser user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserProfile(user: user)));
        },
        leading: const CircleAvatar(backgroundImage: NetworkImage('https://unitycharity.com/wp-content/uploads/2015/09/wallpaper-for-facebook-profile-photo-1.jpg'), radius: 30, ),
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(user.username, style: const TextStyle(fontWeight: FontWeight.w500),), Text(user.fullname, style: const TextStyle(color: Colors.grey, fontSize: 14),) ]),
    );}
}