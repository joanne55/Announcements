import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {

  final String note;
  NoteCard({this.note});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: <Widget>[
            Text(
              note,
              style: TextStyle(
                fontSize: 20.0,
                color:Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
