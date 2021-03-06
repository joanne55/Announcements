import 'package:announcement_test/models/announcement_question.dart';
import 'package:announcement_test/pages/create_announcement.dart';
import 'package:flutter/material.dart';
import 'package:announcement_test/models/announcement_card.dart';
import 'package:announcement_test/models/announcement.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class announcementPage extends StatefulWidget {
  @override
  _announcementPageState createState() => _announcementPageState();
}

class _announcementPageState extends State<announcementPage> {

  //Map data = {};

  @override
  Widget build(BuildContext context) {

    //data = ModalRoute.of(context).settings.arguments;
    //Announcement announcement = data['newAnnouncement'];
    
//    List of announcement should be received from loading_announcement.dart from data base and output here
    List<Announcement> announcements = [
      Announcement(id: 1,title: 'Deload on 23rd April', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Aenean et tortor at risus viverra adipiscing at. '),
      Announcement(id: 2,title: 'Training on 21st April', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Aenean et tortor at risus viverra adipiscing at. '),
      Announcement(id: 3,title: 'Meeting on 10 April', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Aenean et tortor at risus viverra adipiscing at. ')
    ];

    //if(announcement != null)
    //  {
    //    announcements.add(announcement);
    //  }
      
    announcements[0].acknowledgeMembers = [
      'Meben',
      'Mebin'
    ];
    announcements[0].questions.add(Question(question:'How much should we deload by? Should we still come to school to train?'));
    announcements[0].questions.add(Question(question:'How long should this take into affect?'));
    announcements[0].questions.add(Question(question:'Why mebin smells?'));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Announcements'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: announcements.map((announcement) => AnnouncementCard(
              announcement:announcement
          )).toList(),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),

        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute
            (builder: (BuildContext context) => announcementCreate())
          );
        },
      ),
    );
  }
}
