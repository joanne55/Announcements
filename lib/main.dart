/*
import 'package:announcement_test/pages/announcement_acknowledged_page.dart';
import 'package:announcement_test/pages/announcement_info_page.dart';
import 'package:announcement_test/pages/announcement_question_page.dart';
import 'package:announcement_test/pages/create_notes.dart';
import 'package:flutter/material.dart';
import 'package:announcement_test/pages/admin_announcement_page.dart';
import 'package:announcement_test/pages/create_announcement.dart';
import 'package:announcement_test/pages/loading_announcement.dart';


void main() => runApp(MaterialApp(
  //home: announcementPage(),
  initialRoute: '/',
  routes:{
    '/': (context) => announcementPage(),
    //'/announcePage': (context) => announcementPage(),
    '/announceCreate': (context) => announcementCreate(),
    '/noteCreate': (context) => noteCreate(),
    '/announceAcknowledge': (context) => announcementAcknowledged(),
    '/announceInfo': (context) => announcementInfo(),
    '/announceQuestion': (context) => announcementQuestion(),
  },
));
*/

import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/wrapper.dart';
import 'services/auth.dart';
import 'models/authentication/user.dart';


void main() => runApp(MyApp());

/*class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage(),
    );
  }
}*/


  class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
