import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_final_project/Views/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class MyHomePage4 extends StatefulWidget {
  MyHomePage4({Key key, this.title, this.uid}) : super(key: key);

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
      // setState(() {
      //   imageF = image;
      // });
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

