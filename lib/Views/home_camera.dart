import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_final_project/Views/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class MyHomePage4 extends StatefulWidget {
  MyHomePage4({Key key, this.title, this.uid}) : super(key: key);
  String uid;
  final String title;

  @override
  _MyHomePage4State createState() => _MyHomePage4State();
}

class _MyHomePage4State extends State<MyHomePage4> {
  File imageF;

  _cameraView(ImageSource source) async{
    File image = await ImagePicker.pickImage(source: source);
    if(image != null){
      FirebaseFirestore.instance.collection('userPosts').doc(widget.uid).collection(widget.uid).doc('posts').set(
          {
            "image": image.toString()
          });
    }
    else{
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: IconButton(
          icon: Icon(Icons.add_photo_alternate_outlined,color: Colors.deepOrangeAccent,size: 60),
          onPressed: (){
            _cameraView(ImageSource.camera);
          },
        ),
      ),

    );
  }
}

