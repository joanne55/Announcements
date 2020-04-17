import 'package:announcement_test/pages/announcement_acknowledged_page.dart';
import 'package:announcement_test/pages/announcement_info_page.dart';
import 'package:announcement_test/pages/announcement_question_page.dart';
import 'package:announcement_test/pages/create_notes.dart';
import 'package:flutter/material.dart';
import 'package:announcement_test/pages/announcement_page.dart';
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

