import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/authentication/user.dart';
import 'activity_stream/admin_announcement_page.dart';
import 'activity_stream/student_announcement_page.dart';
import '../shared/loading.dart';

import 'authentication/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);

    //Return either home or authenticate widgets
    if(user == null){
      return Authenticate();
    }
    else {
      return StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance.collection('users').document(user.uid).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
              if(!snapshot.hasData){
                //return Text("LOADING...");
                 return Loading();
              }
              else{
                if(snapshot.data['role'] == 'admin'){
                  return adminAnnouncementPage();
                }
                else {
                  return announcementPage();
                }
              }

          }
      );
    }

  }
}