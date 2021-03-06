import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_final_project/Styles/map.dart';
import 'package:mobile_final_project/Views/account.dart';


class MyHomePage2 extends StatefulWidget {
  MyHomePage2({Key key, this.title,this.uid}) : super(key: key);

  String uid;
  final String title;

  @override
  _MyHomePage2State createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  File imageF;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          _map(context),
          _account(),
        ],
      ),
    );
  }
  Widget _account(){
    return Align(
        alignment: FractionalOffset(0.0,0.05),
        child: IconButton(
          icon: Icon(Icons.account_circle_outlined,color: Colors.deepOrangeAccent,size: 30),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => MyHomePage3(uid:widget.uid)));
          },
        )
    );
  }
  Widget _map(BuildContext context){
    Completer<GoogleMapController> _completer = Completer();
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,

      child: GoogleMap(
        zoomGesturesEnabled: true,
        zoomControlsEnabled: false,
        initialCameraPosition: CameraPosition(target:LatLng(43.661904723121374, -79.38172442298045),zoom: 10),
        onMapCreated: (GoogleMapController controller){
          controller.setMapStyle(mapS.styleMap);
          _completer.complete(controller);
        },
      ),

    );
  }

  // Widget _displayImages(){
  //   FirebaseFirestore.instance.collection("userPost").doc(widget.uid).collection('posts').doc(widget.uid).get().then((value){
  //     setState(() {
  //       imageF = value.data()["image"] as File;
  //     });
  //   });
  //   return Image.file(imageF);
  // }

}