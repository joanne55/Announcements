import 'package:announcement_test/models/acknowledged_member_card.dart';
import 'package:flutter/material.dart';

class announcementAcknowledged extends StatefulWidget {
  @override
  _announcementAcknowledgedState createState() => _announcementAcknowledgedState();
}

class _announcementAcknowledgedState extends State<announcementAcknowledged> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;

    List<String> acknowledgeMembers = data['acknowledgedUsers'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Acknowledged members'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: acknowledgeMembers.map((acknowledgedUser) => UserCard(
              username:acknowledgedUser
          )).toList(),
        ),
      ),
    );
  }
}
