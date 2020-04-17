import 'package:announcement_test/models/announcement_question.dart';
import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {

  final Question question;
  QuestionCard({this.question});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              question.question,
              style: TextStyle(
                fontSize: 20.0,
                color:Colors.grey[800],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,20,0,0),
              child: RaisedButton(
                onPressed: (){

                },
                child: Text(
                  'Respond'
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
