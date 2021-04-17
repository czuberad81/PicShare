import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_final_project/Styles/map.dart';
import 'package:mobile_final_project/Views/account.dart';


class MyHomePage2 extends StatefulWidget {
  MyHomePage2({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePage2State createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {

  int _cIndex = 1;

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
                builder: (context) => MyHomePage3()));
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

}