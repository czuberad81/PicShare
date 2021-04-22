
import 'package:flutter/material.dart';
import 'package:mobile_final_project/Views/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: camel_case_types
// class loginPage extends StatelessWidget{
//   final _auth = FirebaseAuth.instance;
//   String email,password;
//
//   @override
//   Widget build(BuildContext context){
//
//     return new Scaffold(
//       body: Container(
//         color: Colors.black,
//         child: Stack(
//           children: [
//             Positioned.fill(
//               child: Opacity(
//                 opacity: 0.8,
//                 child: Image.asset(
//                   'assets/signinBackground.jpg',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Container(color: Colors.transparent,height: 20),
//                   Image(image: AssetImage('assets/logo_picshare.png'),height: 200,width: 200),
//                   Flexible(
//                       child: Container(
//                         margin: const EdgeInsets.all(10),
//                         child:TextFormField(
//                           onChanged: (x){
//                             email=x;
//                           },
//                           style: TextStyle(color: Colors.white),
//                           decoration: InputDecoration(
//                               hintStyle: TextStyle(color: Colors.white),
//                               hintText: "Enter Email",
//                               filled: true,
//                               fillColor: Colors.black.withOpacity(0.3),
//                               enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(20),
//                                   borderSide: BorderSide(color: Colors.deepOrangeAccent)
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(20),
//                                   borderSide: BorderSide(color: Colors.deepOrangeAccent)
//
//                               )
//
//                           ),
//                         ) ,
//                       )),
//                   Flexible(
//                       child:Container(
//                         margin: const EdgeInsets.all(10),
//                         child:TextFormField(
//                           onChanged: (x){
//                             password=x;
//                           },
//                           obscureText: true,
//                           style: TextStyle(color: Colors.white),
//                           decoration: InputDecoration(
//                               hintStyle: TextStyle(color: Colors.white),
//                               hintText: "Enter Password",
//                               filled: true,
//                               fillColor: Colors.black.withOpacity(0.3),
//                               enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(20),
//                                   borderSide: BorderSide(color: Colors.deepOrangeAccent)
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(20),
//                                   borderSide: BorderSide(color: Colors.deepOrangeAccent)
//
//                               )
//
//                           ),
//                         ) ,
//                       ),),
//                   Flexible(
//                       child:RaisedButton(
//                     onPressed: () async{
//                       try{
//                         final result = await _auth.signInWithEmailAndPassword(email: email.toString().trim(), password: password.toString().trim());
//                         if(result != null){
//                           Navigator.push(context, MaterialPageRoute(
//                               builder: (context) => MyHomePage1(uid: result.user.uid)));
//                         }
//                       }catch(e){
//
//                       }
//                     },
//                         color: Colors.deepOrangeAccent,
//                     child: Text("LOGIN",style: TextStyle(color: Colors.white,fontSize: 20)),
//                     //color: Colors.black12,
//                   ) )
//
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_final_project/Views/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class MyHomePage6 extends StatefulWidget {
  MyHomePage6({Key key, this.title, this.uid}) : super(key: key);

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
  _MyHomePage6State createState() => _MyHomePage6State();
}

class _MyHomePage6State extends State<MyHomePage6> {

  final _auth = FirebaseAuth.instance;
  String email,password;

  _signIn(){
    //https://api.flutter.dev/flutter/material/AlertDialog-class.html
    showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Unable to sign in"),
            content: Text("Username or password incorrect"),
            actions: <Widget>[
              FlatButton(onPressed: () => Navigator.of(context).pop(),
                  child: Text("OK"))
            ],
          );
        }
    );
  }


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.8,
                child: Image.asset(
                  'assets/signinBackground.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(color: Colors.transparent,height: 20),
                  Image(image: AssetImage('assets/logo_picshare.png'),height: 200,width: 200),
                  Flexible(
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child:TextFormField(
                          onChanged: (x){
                            email=x;
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.white),
                              hintText: "Enter Email",
                              filled: true,
                              fillColor: Colors.black.withOpacity(0.3),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.deepOrangeAccent)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.deepOrangeAccent)

                              )

                          ),
                        ) ,
                      )),
                  Flexible(
                      child:Container(
                        margin: const EdgeInsets.all(10),
                        child:TextFormField(
                          onChanged: (x){
                            password=x;
                          },
                          obscureText: true,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.white),
                              hintText: "Enter Password",
                              filled: true,
                              fillColor: Colors.black.withOpacity(0.3),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.deepOrangeAccent)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.deepOrangeAccent)

                              )

                          ),
                        ) ,
                      ),),
                  Flexible(
                      child:RaisedButton(
                    onPressed: () async{
                      try{
                        final result = await _auth.signInWithEmailAndPassword(email: email.toString().trim(), password: password.toString().trim());
                        if(result != null){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => MyHomePage1(uid: result.user.uid)));
                        }
                      }catch(e){
                        _signIn();
                      }
                    },
                        color: Colors.deepOrangeAccent,
                    child: Text("LOGIN",style: TextStyle(color: Colors.white,fontSize: 20)),
                    //color: Colors.black12,
                  ) )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

