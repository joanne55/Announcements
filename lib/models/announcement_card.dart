import 'package:flutter/material.dart';
import 'announcement.dart';

class AdminAnnouncementCard extends StatelessWidget {

  final Announcement announcement;

  AdminAnnouncementCard({this.announcement});

  @override
  Widget build(BuildContext context) {

    bool isAdmin = false;

    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ExpansionTile(
            title: Text(
              announcement.title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color:Colors.grey[600],
              ),
            ),
            children: <Widget>[
              //Description of announcement
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  announcement.description,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //For Default user
//                  RaisedButton.icon(
//                    onPressed: (){
//                      /*
//                        Save user ID to the announcement's acknowledged users list
//                        and mark user as acknowledged forever, meaning
//                        if the user left the announcement page, he/she does not
//                        need to acknowledge again
//                      */
//                    },
//                    icon: Icon(Icons.add_to_photos),
//                    label: Text('Acknowledge'),
//                  ),

                  //For Admin user
                  RaisedButton.icon(
                    onPressed: (){
                      /*
                        Go to acknowledge member list page and view current announcements
                        acknowledged members
                      */
                      Navigator.pushNamed(context, '/announceAcknowledge', arguments:{
                        'acknowledgedUsers' : announcement.acknowledgeMembers,
                      });
                    },
                    icon: Icon(Icons.people),
                    label: Text('Acknowledged'),
                  ),

                  //Questions for both Admin and Default user
                  RaisedButton.icon(
                    onPressed: (){
                      /*
                        Goes to next page passing announcement as an argument
                        The other room should process the ID with firebase and
                        load the announcement as well as questions there
                      */
                      Navigator.pushNamed(context, '/announceInfo', arguments:{
                        'announcement' : announcement,
                      });
                    },
                    icon: Icon(Icons.info_outline),
                    label: Text('More info'),
                  ),

//                  RaisedButton(
//
//                    color: Colors.green,
//                    onPressed: (){
//
//                    },
//                    child:
//                    Text(
//                      'Questions',
//                      style: TextStyle(
//                        fontSize: 18.0,
//                        fontWeight: FontWeight.bold,
//                        color:Colors.grey[100],
//                      ),
//                    ),
//                  ),
                ],
              ),

            ],
          ),

//          Text(
//            announcement.title,
//            style: TextStyle(
//              fontSize: 18.0,
//              fontWeight: FontWeight.bold,
//              color:Colors.grey[600],
//            ),
//          ),
        ],
      ),
    );
  }
}

class StudentAnnouncementCard extends StatefulWidget {
  final Announcement announcement;
  const StudentAnnouncementCard({ this.announcement, Key key}):super(key:key);

  _StudentAnnouncementCardState createState() => _StudentAnnouncementCardState();
}

class _StudentAnnouncementCardState extends State<StudentAnnouncementCard> {

  Icon icon = Icon(Icons.check_box_outline_blank);
  String ackBtnText = 'Acknowledge';

  @override
  Widget build(BuildContext context) {

    bool isAdmin = false;

    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ExpansionTile(
            title: Text(
              widget.announcement.title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color:Colors.grey[600],
              ),
            ),
            children: <Widget>[
              //Description of announcement
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  widget.announcement.description,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //For Default user
//                  RaisedButton.icon(
//                    onPressed: (){
//                      /*
//                        Save user ID to the announcement's acknowledged users list
//                        and mark user as acknowledged forever, meaning
//                        if the user left the announcement page, he/she does not
//                        need to acknowledge again
//                      */
//                    },
//                    icon: Icon(Icons.add_to_photos),
//                    label: Text('Acknowledge'),
//                  ),

                  //For Admin user
                  RaisedButton.icon(
                    onPressed: (){
                      setState(() {
                        icon = Icon(Icons.check_box);
                        ackBtnText = 'Acknowledged';
                      });
                    },
                    icon: icon,
                    label: Text(ackBtnText),
                  ),

                  //Questions for both Admin and Default user
                  RaisedButton.icon(
                    onPressed: (){
                      /*
                        Goes to next page passing announcement as an argument
                        The other room should process the ID with firebase and
                        load the announcement as well as questions there
                      */
                      Navigator.pushNamed(context, '/announceInfo', arguments:{
                        'announcement' : widget.announcement,
                      });
                    },
                    icon: Icon(Icons.info_outline),
                    label: Text('More info'),
                  ),

//                  RaisedButton(
//
//                    color: Colors.green,
//                    onPressed: (){
//
//                    },
//                    child:
//                    Text(
//                      'Questions',
//                      style: TextStyle(
//                        fontSize: 18.0,
//                        fontWeight: FontWeight.bold,
//                        color:Colors.grey[100],
//                      ),
//                    ),
//                  ),
                ],
              ),

            ],
          ),

//          Text(
//            announcement.title,
//            style: TextStyle(
//              fontSize: 18.0,
//              fontWeight: FontWeight.bold,
//              color:Colors.grey[600],
//            ),
//          ),
        ],
      ),
    );
  }
}