import 'package:announcement_test/models/announcement_question.dart';
import 'package:announcement_test/pages/activity_stream/admin_announcement_page.dart';
import 'package:flutter/material.dart';
import 'package:announcement_test/models/announcement.dart';
import 'package:announcement_test/models/announcement_form.dart';
import 'package:validators/validators.dart';

class noteCreate extends StatefulWidget {
  @override
  _noteCreateState createState() => _noteCreateState();
}

class _noteCreateState extends State<noteCreate> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('To post'),
        centerTitle: true,
      ),
      body: noteForm(),
    );
  }
}

class noteForm extends StatefulWidget {
  @override
  _noteFormState createState() => _noteFormState();
}

class _noteFormState extends State<noteForm> {

  Map data = {};

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    Announcement announcement = data['announcement'];
    bool isAdmin = data['isAdmin'];
    final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;

    if(isAdmin)
      {
        return Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                    'Note',
                    style: TextStyle(
                      color: Colors.grey[900],
                      letterSpacing: 2.0,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    )
                ),
                textForm(
                  placeholder: 'e.g Attire for the meeting will be...',
                  lineNum: 5,
                  validator: (String value) {
                    if (value.length == 0) {
                      return 'Please enter a valid note';
                    }
                    return null;
                  },
                  onSubmit: (String value)
                  {
                    announcement.notes.add(value);
                  },
                ),

                RaisedButton(
                  color: Colors.blueAccent,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();

                      //Saved note to announcement.note in onSubmit and update data base
                      Navigator.pushReplacementNamed(context, '/announceInfo', arguments: {
                        'announcement': announcement
                      });
                    }
                  },
                  child: Text(
                    'Post',
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
    else
      {
        return Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                    'Question',
                    style: TextStyle(
                      color: Colors.grey[900],
                      letterSpacing: 2.0,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    )
                ),
                textForm(
                  placeholder: 'e.g What attire should we wear?...',
                  lineNum: 5,
                  validator: (String value) {
                    if (value.length == 0) {
                      return 'Please enter a valid question';
                    }
                    return null;
                  },
                  onSubmit: (String value)
                  {
                    Question question = Question();
                    question.question = value;
                    announcement.questions.add(question);
                  },
                ),

                RaisedButton(
                  color: Colors.blueAccent,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();

                      //Saved note to announcement.note in onSubmit and update data base
                      Navigator.pushReplacementNamed(context, '/announceInfo', arguments: {
                        'announcement': announcement
                      });
                    }
                  },
                  child: Text(
                    'Post',
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
}