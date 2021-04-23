import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_final_project/Views/home_map.dart';
import 'package:mobile_final_project/Views/home_camera.dart';


class MyHomePage1 extends StatefulWidget {
  MyHomePage1({Key key, this.title,  this.uid}) : super(key: key);
  String uid;
  final String title;

  @override
  _MyHomePage1State createState() => _MyHomePage1State();
}

class _MyHomePage1State extends State<MyHomePage1> {
  int _cIndex = 1;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child:_widget(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _cIndex,
        selectedItemColor: Colors.deepOrangeAccent,
        unselectedItemColor: Colors.deepOrange.shade200,
        backgroundColor: Colors.blueGrey.shade900,
        items:[
          BottomNavigationBarItem(icon: Icon(Icons.add_a_photo_outlined),title: Text('Take Picture')),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.person_search_outlined),title: Text('Search'))
        ],
        onTap: (x){
          setState(() {
            print(widget.uid);
            _cIndex = x;
          });
        },
      ),
    );
  }
 Widget _widget(){
    if(_cIndex == 0){
      return MyHomePage4(uid:widget.uid);
    }
    else if(_cIndex == 1){
      return MyHomePage2(uid:widget.uid);
    }
    else if(_cIndex == 2){
      return Center(child: Text("friends"));
    }
 }
}

