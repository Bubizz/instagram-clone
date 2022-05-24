import 'package:cloud_firestore/cloud_firestore.dart';

class dbMethods {
  CollectionReference users = FirebaseFirestore.instance.collection("users");

  Future<bool> isUsernameAvailable(String username) async {
    try {
      var user = await users.doc(username).get(const GetOptions(source: Source.server));
      if (user.exists) {
        return false;
      }
    } catch (e) {
      throw Exception("Something went wrong");
    }

    return true;
  }

  Future addUserInfoToDB(String username, String fullName) async {
    var userInfo = {
      'fullName': fullName,
    };

    await users.doc(username).set(userInfo);
  }
}
