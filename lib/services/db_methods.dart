import 'package:cloud_firestore/cloud_firestore.dart';

class dbMethods {
  CollectionReference users = FirebaseFirestore.instance.collection("users");

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
}
