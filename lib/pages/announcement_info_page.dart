import 'package:announcement_test/models/announcement.dart';
import 'package:announcement_test/models/announcement_note_card.dart';
import 'package:announcement_test/models/announcement_question_card.dart';
import 'package:flutter/material.dart';

class announcementInfo extends StatefulWidget {
  @override
  _announcementInfoState createState() => _announcementInfoState();
}

class _announcementInfoState extends State<announcementInfo> {

  Map data = {};
  bool isAdmin = false;

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;

    Announcement announcement = data['announcement'];

    if(announcement.notes[0] == '0 Notes' && announcement.notes.length >1)
      {
        announcement.notes.removeAt(0);
      }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('More info'),
        centerTitle: true,
      ),
      body:
      SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                //Announcement section
                Text(
                  'Announcement',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),

                Divider(
                  height: 50.0,
                  color: Colors.grey[800],
                  thickness: 2.0,
                ),

                Text(
                    announcement.title,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0,10,0,30),
                  child: Text(
                    announcement.description,
                    style: TextStyle(
                      fontSize: 18.0,
                    )
                  ),
                ),

                //Note section
                Text(
                  'Notes',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),

                Divider(
                  height: 50.0,
                  color: Colors.grey[800],
                  thickness: 2.0,
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,0,30),
                  child: Column(
                    children: announcement.notes.map((notes) => NoteCard(
                        note:notes
                    )).toList(),
                  ),
                ),

                //Question section
                Text(
                  'Questions',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),

                Divider(
                  height: 50.0,
                  color: Colors.grey[800],
                  thickness: 2.0,
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,0,30),
                  child: Column(
                    children: announcement.questions.map((question) => QuestionCard(
                        question:question
                    )).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),

      //Add notes as admin
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),

        onPressed: (){
          //Goes to note creation page
          Navigator.pushNamed(context, '/noteCreate', arguments: {
            'announcement': announcement,
            'isAdmin':isAdmin,
          });
        },
      ),
    );
  }
}
