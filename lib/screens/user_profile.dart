import 'package:flutter/material.dart';
import 'package:instagram/models/app_user.dart';
import 'package:instagram/services/db_methods.dart';
import '../models/post.dart';

class UserProfile extends StatefulWidget {
  UserProfile({Key? key, required this.user}) : super(key: key);
  AppUser user;

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  var posts = <Post>[];

  @override
  void initState() {
    dbMethods().fetchPosts(widget.user.uid).then((value) {
      setState(() {
        posts = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.user.username)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Column(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://unitycharity.com/wp-content/uploads/2015/09/wallpaper-for-facebook-profile-photo-1.jpg',
                      ),
                      radius: 46.0,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.user.fullname,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                const Spacer(
                  flex: 2,
                ),
                Column(
                  children: [
                    Text("0", style: Theme.of(context).textTheme.bodyLarge),
                    const Text("Posts")
                  ],
                ),
                const Spacer(
                  flex: 1,
                ),
                Column(
                  children: [
                    Text(
                      widget.user.followers.toString(),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const Text("Followers")
                  ],
                ),
                const Spacer(
                  flex: 1,
                ),
                Column(
                  children: [
                    Text(widget.user.followers.toString(),
                        style: Theme.of(context).textTheme.bodyLarge),
                    const Text("Following")
                  ],
                )
              ],
            ),
            FractionallySizedBox(
              widthFactor: 0.3,
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Follow"),
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey))),
            ),
            Expanded(
                child: GridView.builder(
                    itemCount: posts.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        child: Image.network(
                          posts[index].imageUrl,
                          fit: BoxFit.cover,
                        ),
                      );
                    }))
          ]),
        ),
      ),
    );
  }
}
