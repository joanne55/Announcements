import 'package:flutter/material.dart';

class announcementQuestion extends StatefulWidget {
  @override
  _announcementQuestionState createState() => _announcementQuestionState();
}

class _announcementQuestionState extends State<announcementQuestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Question'),
        centerTitle: true,
      ),

    );
  }
}
