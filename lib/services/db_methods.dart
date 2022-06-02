import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

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

  Future addUserInfoToDB({required String uid, required String username} ) async {
    var userInfo = {
      'username': username,
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

  Future<String?> fetchUsername({required String id}) async
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
      print('błąd');
      rethrow;
    }
  
    return await storageRef.getDownloadURL();

  }

  Future uploadPost({ required  String authorUID, required String description, required File imageToSend  }) async
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
      'description': description,
      'author' : authorUID,
      'creationDate' : DateTime.now(),
      'imgUrl' : imgUrl,
    };

    posts.doc(postID).set(postInfo);

  }
}
