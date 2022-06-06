


import 'package:cloud_firestore/cloud_firestore.dart';

class Post
{

Timestamp creationDate;
String description;
String imageUrl;
String postID;
List<dynamic> likes;

Post(this.creationDate, this.description, this.imageUrl, this.likes, this.postID);

factory Post.fromJSON(Map<String, dynamic> map) {
  return Post(map['creationDate'], map['description'] , map['imgUrl'], map["likes"], map['postId']);

}












}