import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_final_project/Views/home_map.dart';



class MyHomePage3 extends StatefulWidget {
  MyHomePage3({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePage3State createState() => _MyHomePage3State();
}

class _MyHomePage3State extends State<MyHomePage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: Column(
          children: [
            Container(color: Colors.transparent,height: 40),
            Container(
              child:CircleAvatar(
                backgroundImage: AssetImage("assets/noImage.jpg"),
                radius: 70,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.deepOrangeAccent,width: 2)
              ),
            ),
            Container(color: Colors.transparent,height: 100),
            SizedBox(
              width: 250,
              child:  RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)
                  ),
                  color: Colors.deepOrangeAccent,
                  onPressed: () {  },
                  child: Text("Account Information",style: TextStyle(color: Colors.white))
              ),
            ),
            SizedBox(
              width: 250,
              child:  RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)
                  ),
                  color: Colors.deepOrangeAccent,
                  onPressed: () {  },
                  child: Text("Logout",style: TextStyle(color: Colors.white))
              ),
            ),
            SizedBox(
              width: 250,
              child:  RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)
                  ),
                  color: Colors.deepOrangeAccent,
                  onPressed: () {  },
                  child: Text("Delete Account",style: TextStyle(color: Colors.white))
              ),
            )


          ],
        ),
      ),
    );
  }
}