import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_final_project/Views/home_map.dart';
import 'package:mobile_final_project/Views/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';



class MyHomePage3 extends StatefulWidget {
  MyHomePage3({Key key, this.title,this.uid}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  String uid;
  final String title;

  @override
  _MyHomePage3State createState() => _MyHomePage3State();
}

class _MyHomePage3State extends State<MyHomePage3> {
    String tempFirst;
    String tempLast;
    String tempEmail;
    final _auth = FirebaseAuth.instance;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final CollectionReference userC = FirebaseFirestore.instance.collection('users');
    final CollectionReference userI = FirebaseFirestore.instance.collection('userPosts');
    _displayInfo(){
      FirebaseFirestore.instance.collection("users").doc(widget.uid).get().then((value){
        setState(() {
          tempFirst = value.data()["firstName"];
          tempLast = value.data()["lastName"];
          tempEmail = value.data()["email"];
        });
      });
      return Container(
        child: Column(
          children: [
            Text(tempFirst.toString(),style: TextStyle(color: Colors.white,fontSize: 20)),
            Text(tempLast.toString(),style: TextStyle(color: Colors.white,fontSize: 20)),
            Text(tempEmail.toString(),style: TextStyle(color: Colors.white,fontSize: 20))
          ],
        ),
      //tempFirst.toString() + tempLast.toString() + tempEmail.toString()
    );
  }
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
            Container(
              child: _displayInfo(),
              ),
            SizedBox(
              width: 250,
              child:  RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)
                  ),
                  color: Colors.deepOrangeAccent,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => MyHomePage()));
                  },
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
                  onPressed: () async{
                    try{
                      final result = await _auth.currentUser;
                      result.delete();
                      userC.doc(widget.uid).delete();
                      userI.doc(widget.uid).delete();
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => MyHomePage()));

                    }catch(e){
                      print('not deleted');
                    }

                  },
                  child: Text("Delete Account",style: TextStyle(color: Colors.white))
              ),
            )
          ],
        ),
      ),
    );
  }
}