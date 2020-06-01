import '../../models/announcement_question.dart';
import 'create_announcement.dart';
import 'package:flutter/material.dart';
import '../../models/announcement_card.dart';
import '../../models/announcement.dart';
import '../../services/auth.dart';

class adminAnnouncementPage extends StatefulWidget {
  @override
  _announcementPageState createState() => _announcementPageState();
}

class _announcementPageState extends State<adminAnnouncementPage> {

  //Map data = {};
  String dropdownValue = 'Future events';
  @override
  Widget build(BuildContext context) {
    //data = ModalRoute.of(context).settings.arguments;
    //Announcement announcement = data['newAnnouncement'];
    
    //List of announcement should be received from loading_announcement.dart from data base and output here
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
        actions: <Widget>[
          InkWell(
            onTap: () async {
              await AuthService().signOut();
            },
            child: Icon(Icons.exit_to_app),
          ),
        ],
      ),

      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Filter events'),
              DropdownButton(
                value: dropdownValue,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: <String>['Future events', 'Past events', 'All events', 'My events']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          Container(
            height: 500,
            child: ListView(
              children: announcements.map((announcement) => AdminAnnouncementCard(
                  announcement:announcement
              )).toList(),
            ),
          ),
        ]
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
