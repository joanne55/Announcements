import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/authentication/user.dart';

class AuthService {

  //To get a firebaseAuth instance, the underscore is meant to indicate
  //that the attribute is private
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  //Create user object based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user){

    //var userData = DatabaseService(uid: user.uid).userData;
    //DatabaseService(uid: user.uid);
    if(user!=null){
      User user1 = User(uid: user.uid,);
      return user1;
    }
    else {
      return null;
    }
  }

  //Auth Change User Stream - Stream of User
  Stream<User> get user {
    //by right the onAuthStateChanged is meant for FirebaseUser object, so
    //you have to .map it to become a normal User so u get use it
    return _auth.onAuthStateChanged
    .map((FirebaseUser user) => _userFromFirebaseUser(user));
    //.map(_userFromFirebaseUser);
  }

/*
  //Sign In Anonymously
  Future signInAnon() async {
    try{
      //await because the functions will take awhile to be completed
      AuthResult result = await _auth.signInAnonymously();
      //user object
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);

    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
*/

  //Sign In with Email and Password
  Future signInAccount(String email, String password) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
      FirebaseUser user = result.user;

      //await Firestore.instance.collection('COLLECTION_NAME').document('TESTID1');
      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  //Register with Email and Password
  Future registerAccount(String email, String password, String role) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password); 
      FirebaseUser user = result.user;

      Firestore.instance
          .collection('users').document(user.uid).setData({'name': email, 'pemGroup': 'SF1804', 'role': role});
      //create a new record of a user
      //await DatabaseService(uid: user.uid).updateUserData("0", "New Crew Member", 100);
      //await DatabaseService(uid: user.uid).createUserDocument("Tom Cruise", "SF1804", "admin");
      return _userFromFirebaseUser(user);
    }
    catch(error){
      print(error.toString());
      return null;
    }
  }

  //Sign Out with Email and Password
  Future signOut() async {
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

}