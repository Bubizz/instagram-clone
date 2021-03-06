import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:instagram/models/post.dart';
import 'package:uuid/uuid.dart';
import '../models/app_user.dart';

class dbMethods {
  CollectionReference users = FirebaseFirestore.instance.collection("users");
  CollectionReference posts = FirebaseFirestore.instance.collection("posts");

  Future<bool> isUsernameAvailable(String username) async {
    try {
      var usersdocs = await users.where("username", isEqualTo: username).get(const GetOptions(source: Source.server));
      if (usersdocs.docs.isNotEmpty) {
        return false;
      }
    } catch (e) {
      throw Exception("Something went wrong");
    }

    return true;
  }

  Future addUserInfoToDB({required String uid, required String username, required String fullname} ) async {
    var userInfo = {
      'username': username,
      'followers' : 0,
      'following' : 0,
      'uid' : uid,
      'fullname' : fullname

    };
    try
    {
    await users.doc(uid).set(userInfo);
    }
    catch (e)
    {
      rethrow;
    }

  }

  Future<String> fetchUsername({required String id}) async
  {
    var snapshot = await users.doc(id).get();

    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
   
    return data["username"];

  }

  Future<String> uploadImage({required String uid, required File imageToSend}) async
  {
    final storageRef = FirebaseStorage.instance.ref().child("posts/").child(uid).child(const Uuid().v1());

    try
    {
      await storageRef.putFile(imageToSend);
    }
    catch (e)
    {
    
      rethrow;
    }
  
    return await storageRef.getDownloadURL();

  }

  Future uploadPost({ required  String authorUID, required String description, required File imageToSend, }) async
  {
    var postID = const Uuid().v1();
    late String imgUrl;
  try
  {
    imgUrl = await uploadImage(uid: authorUID, imageToSend: imageToSend, );
  }
  catch (e)
  {
    throw Exception();
  }
  var postInfo = {
      'postId' : postID,
      'description': description,
      'author' : authorUID,
      'creationDate' : DateTime.now(),
      'imgUrl' : imgUrl,
      'likes' : [],
    
    };

    posts.doc(postID).set(postInfo);

  }

  Future<List<AppUser>> findUsers(String name) async
  { 
    var list = <AppUser>[];
    var query = await FirebaseFirestore.instance
      .collection('users')
      .orderBy('username')
      .startAt([name])
      .endAt([name + '\uf8ff']).get();

    query.docs.forEach((element) {
   
      list.add(AppUser.fromJSON(element.data()));
      });

    return list;
  }

   Future<List<Post>> fetchPosts(String uid) async
  {
    
    var userPosts = await posts.where('author', isEqualTo:  uid).get();

    var listOfPost = <Post>[];

    for(var post in userPosts.docs)
    {
   
      print(post.data());
      listOfPost.add(Post.fromJSON(post.data() as Map<String, dynamic>));
    }

    return listOfPost;
    
    
  }

  Future likePost(String postId, String userId) async
  {
    var data = await posts.doc(postId).get();
    var post =  Post.fromJSON(data.data() as Map<String, dynamic>);
    if(post.likes.contains(userId))
    {
      posts.doc(postId).update({'likes' : FieldValue.arrayUnion([userId])});
    }
    else
    {
      posts.doc(postId).update({'likes' : FieldValue.arrayRemove([userId])});
    }
    

    
  }

   
}
