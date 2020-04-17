import 'package:announcement_test/pages/announcement_page.dart';
import 'package:flutter/material.dart';
import 'package:announcement_test/models/announcement.dart';
import 'package:announcement_test/models/announcement_form.dart';
import 'package:validators/validators.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class announcementCreate extends StatefulWidget {
  @override
  _announcementCreateState createState() => _announcementCreateState();
}

class _announcementCreateState extends State<announcementCreate> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Announcement creation'),
        centerTitle: true,
      ),
      body: announcementForm(),
    );
  }
}

class announcementForm extends StatefulWidget {
  @override
  _announcementFormState createState() => _announcementFormState();
}

class _announcementFormState extends State<announcementForm> {
  final _formKey = GlobalKey<FormState>();
  Announcement announcement = Announcement();
  final databaseReference = Firestore.instance;

  // Create new document if it does not exist or replace the existing
  void createRecord(Announcement an) async {
    await databaseReference.collection("announcements")
        .document(announcement.title)
        .setData({
      'title': announcement.title,
      'description': announcement.description,
    });
//
//    DocumentReference ref = await databaseReference.collection("books")
//        .add({
//      'title': 'Flutter in Action',
//      'description': 'Complete Programming Guide to learn Flutter'
//    });
//    print(ref.documentID);
  }

  @override
  Widget build(BuildContext context) {

    final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                'Announcement Title',
                style: TextStyle(
                  color: Colors.grey[900],
                  letterSpacing: 2.0,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                )
            ),
            textForm(
              placeholder: 'e.g Meeting on 27th April 2020...',
              lineNum: 2,
              validator: (String value) {
                if (value.length == 0) {
                  return 'Please enter a valid title';
                }
                return null;
              },
              onSubmit: (String value)
              {
                announcement.title = value;
              },
            ),
            Text(
                'Description',
                style: TextStyle(
                  color: Colors.grey[900],
                  letterSpacing: 2.0,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                )
            ),
            textForm(
              placeholder: 'e.g CCA shirts will be given out to...',
              lineNum: 4,
              onSubmit: (String value)
              {
                announcement.description = value;
              },
            ),

          RaisedButton(
            color: Colors.blueAccent,
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();

                //Send to announcement page and save to data base
                announcement.id = 1;
                print(announcement.id);
                print(announcement.title);
                print(announcement.description);

                createRecord(announcement);

                /*
                  Not suppose to pass anything as argument
                  Created announcement should be saved to data base
                  and the announcement page should load the newly
                  created announcement in
                */

                Navigator.pushReplacementNamed(context, '/', arguments: {
                  'newAnnouncement': announcement
                });
              }
            },
            child: Text(
              'Create',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
          ],
        ),
      ),
    );
  }
}