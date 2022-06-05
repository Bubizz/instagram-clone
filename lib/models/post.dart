


import 'package:cloud_firestore/cloud_firestore.dart';

class Post
{

Timestamp creationDate;
String description;
String imageUrl;

Post(this.creationDate, this.description, this.imageUrl);

factory Post.fromJSON(Map<String, dynamic> map) {
  return Post(map['creationDate'], map['description'] , map['imgUrl'],);

}












}