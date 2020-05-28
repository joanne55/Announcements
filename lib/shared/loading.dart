import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/*

var _connectionStatus = "Unknown";
Connectivity connectivity;
//sequence of events to track if they on/off wifi
StreamSubscription<ConnectivityResult> subscription;


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {
    super.initState();
    connectivity = new Connectivity();
    subscription = connectivity.onConnectivityChanged.listen((ConnectivityResult result){
      _connectionStatus = result.toString();
      print(result);
      if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {

      }
      else {
        Loading();
      }

    });

  }

  @override
  void dispose(){
    //to release all subscriptions
    subscription.cancel();
    super.dispose();
  }

*/


class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100],
      child: Center(
        child: SpinKitRotatingCircle(
          color: Colors.brown,
          size: 80.0,
        ),
      ),
    );
  }
}
