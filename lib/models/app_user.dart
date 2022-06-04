
class AppUser
{
  String uid;
  String fullname;
  String username;
  int followers;
  int following;

  AppUser(this.uid, this.fullname, this.username, this.followers, this.following);

  factory AppUser.fromJSON(Map<String, dynamic> map) {
    return AppUser(map['uid'], map['fullname'] , map['username'], map['followers'], map['following']);
  }




}