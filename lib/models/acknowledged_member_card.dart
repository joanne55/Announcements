import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {

  final String username;
  UserCard({this.username});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: <Widget>[
//            Icon(
//                Icons.account_circle,
//            ),
            Text(
              username,
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
