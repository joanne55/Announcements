import 'auth.dart';
import 'package:intl/intl.dart';
import 'dart:collection';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/authentication/user.dart';

final databaseRef = Firestore.instance;

void generateCode(String eventId) {
  var codeGenerator = new Random.secure();
  int code = codeGenerator.nextInt(999999 - 100000) + 100000;
  _uploadCode(code, eventId);
}

void _uploadCode(int code, String eventId) {
  databaseRef.collection('events').document(eventId).updateData({'code': code.toString()});
}

Future<bool> checkCode (int inputCode, String uid) async {
  var userData = await databaseRef.collection('users').document(uid).get();
  Map attendedEvents = await userData['attendedEvents'];
  QuerySnapshot _query = await databaseRef.collection('events').getDocuments();
  var _documents = _query.documents;
  bool _validCode = false;
  _documents.forEach((DocumentSnapshot snapshot) {
    print(snapshot.data['code']);
    if(snapshot.data['code'] == inputCode.toString() && inputCode.toString().length == 6) {
      if(snapshot.data['attendees'].contains(userData.reference) && !attendedEvents.containsValue(snapshot.reference)) {
        print('updating');
        var newAttendedEvents = attendedEvents;
        newAttendedEvents[DateTime.now().add(Duration(hours: 8)).toString()] = snapshot.reference;
        databaseRef.collection('users').document(uid).updateData({'attendedEvents': newAttendedEvents});
      }
      _validCode = true;
    }
  });
  return _validCode;
}

class UserDatabaseService {

  final String uid;
  //Constructor
  UserDatabaseService({this.uid});
  //Collection Reference
  //Firestore will auto-create it if its not there already
  final CollectionReference usersCollection = Firestore.instance.collection('users');

  //Used when user sign ups, and also when they change their brew preference
  Future updateUserData(String sugars, String name, String pemGroup) async{
    return await usersCollection.document(uid).setData({
      'uid': uid,
      'name': name,
      'pemGroup': pemGroup,
    });
  }

  //userData object from snapshat
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      pemGroup: snapshot.data['pemGroup'],
      role: snapshot.data['role'],
    );
  }

  //Get User Document Stream
  Stream<UserData> get userData{
    return usersCollection.document(uid).snapshots()
        .map(_userDataFromSnapshot);
  }

  //calculate the attendance rate of student
  Future<double> calculateAttendanceRate () async {
    double rate;
    //number of events
    int numEvents = 0;
    var userData = await databaseRef.collection('users').document(uid).get();
    var events = await databaseRef.collection('events').getDocuments();
    Map attendedEvents = userData['attendedEvents'];
    events.documents.forEach(
            (event) {
          List attendees = event['attendees'];
          if(attendees.contains(userData.reference)) {
            numEvents += 1;
          }
        }
    );
    if(numEvents == 0) {
      return 0;
    }
    rate = attendedEvents.length/numEvents;
    print(rate);
    return rate*100;
  }

  //get a Map of attended events where the keys are ordered from earliest to latest.
  Future<Map> getAttendedEvents () async {
    var document = await databaseRef.collection('users').document(uid).get();
    //SplayTreeMap is a special map where the keys are ordered.
    var attendedEvents = SplayTreeMap.from(document['attendedEvents']);
    return attendedEvents;
  }



  void updateAttendedEvents (DocumentReference eventRef) async {
    SplayTreeMap newAttendedEvents = await getAttendedEvents();
    if(!newAttendedEvents.containsValue(eventRef)) {
      newAttendedEvents[DateTime.now().add(Duration(hours: 8)).toString()] = eventRef;
      databaseRef
          .collection('users')
          .document(uid)
          .updateData({'attendedEvents': newAttendedEvents});
    }
  }

  void removeAttendedEvent (DocumentReference eventRef) async {
    SplayTreeMap  attendedEvents = await getAttendedEvents();
    SplayTreeMap newAttendedEvents = await getAttendedEvents();
    if(attendedEvents.containsValue(eventRef)) {
      attendedEvents.forEach(
        (timestamp, value) {
          if(value == eventRef) {
            newAttendedEvents.remove(timestamp);
          }
        }
      );
      await databaseRef.collection('users').document(uid).updateData({'attendedEvents': newAttendedEvents});
    }
  }
}