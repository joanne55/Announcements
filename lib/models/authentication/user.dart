class User {

  final String uid;
  final String role;
  final String email;
  final Map attendedEvents;
  User({this.uid, this.role,this.email,this.attendedEvents});
  
}

class UserData {
  final String uid;
  final String name;
  final String pemGroup;
  final String role;

  UserData({this.uid, this.name, this.pemGroup, this.role});

}
