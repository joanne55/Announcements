import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class announcementLoading extends StatefulWidget {
  @override
  _announcementLoadingState createState() => _announcementLoadingState();
}

class _announcementLoadingState extends State<announcementLoading> {

  void setUpAnnouncement() async
  {
    //Get all announcements from database and send over to announcement page
    Navigator.pushReplacementNamed(context, '/announcePage');
  }

  @override
  void initState() {
    super.initState();
    setUpAnnouncement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.grey[900],
      body: Center(
        child: SpinKitRing(
          color: Colors.grey[900],
//          color: Colors.amber,
          size: 80.0,
        ),
      ),
    );
  }
}
