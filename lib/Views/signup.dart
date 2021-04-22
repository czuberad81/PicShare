import 'package:flutter/material.dart';
import 'package:mobile_final_project/Views/login.dart';
import 'package:mobile_final_project/Views/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: camel_case_types
// class signupPage extends StatelessWidget{
//
//   final _auth = FirebaseAuth.instance;
//   String email,password;
//   @override
//   Widget build(BuildContext context){
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
//                   Container(color: Colors.transparent,height: 50),
//               Flexible(
//               child: Container(
//               margin: const EdgeInsets.all(10),
//               child:TextFormField(
//                 style: TextStyle(color: Colors.white),
//                 decoration: InputDecoration(
//                     hintStyle: TextStyle(color: Colors.white),
//                     hintText: "Enter Firstname",
//                     filled: true,
//                     fillColor: Colors.black.withOpacity(0.3),
//                     enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         borderSide: BorderSide(color: Colors.deepOrangeAccent)
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         borderSide: BorderSide(color: Colors.deepOrangeAccent)
//                     )
//                 ),
//               ) ,
//             )
//               ),
//               Flexible(
//               child: Container(
//               margin: const EdgeInsets.all(10),
//               child:TextField(
//               style: TextStyle(color: Colors.white),
//               decoration: InputDecoration(
//               hintStyle: TextStyle(color: Colors.white),
//               hintText: "Enter Lastname",
//               filled: true,
//                   fillColor: Colors.black.withOpacity(0.3),
//               enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(20),
//               borderSide: BorderSide(color: Colors.deepOrangeAccent)
//               ),
//               focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(20),
//               borderSide: BorderSide(color: Colors.deepOrangeAccent)
//
//               )
//
//               ),
//               ) ,
//               )
//               ),
//               Flexible(
//                 child:Container(
//                   margin: const EdgeInsets.all(10),
//                   child:TextFormField(
//                     onChanged: (x){
//                       email=x;
//                     },
//                     style: TextStyle(color: Colors.white),
//                     decoration: InputDecoration(
//                         hintStyle: TextStyle(color: Colors.white),
//                         hintText: "Enter Email",
//                         filled: true,
//                         fillColor: Colors.black.withOpacity(0.3),
//                         enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20),
//                             borderSide: BorderSide(color: Colors.deepOrangeAccent)
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20),
//                             borderSide: BorderSide(color: Colors.deepOrangeAccent)
//
//                         )
//
//                     ),
//                   ) ,
//                 )
//               ),
//               Flexible(
//                 child:Container(
//                   margin: const EdgeInsets.all(10),
//                   child:TextFormField(
//                     onChanged: (x){
//                       password = x;
//                     },
//                     obscureText: true,
//                     style: TextStyle(color: Colors.white),
//                     decoration: InputDecoration(
//                         hintStyle: TextStyle(color: Colors.white),
//                         hintText: "Enter Password",
//                         filled: true,
//                         fillColor: Colors.black.withOpacity(0.3),
//                         enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20),
//                             borderSide: BorderSide(color: Colors.deepOrangeAccent)
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20),
//                             borderSide: BorderSide(color: Colors.deepOrangeAccent)
//
//                         )
//
//                     ),
//                   ) ,
//                 )
//               ),
//                   Container(color: Colors.transparent,height: 40),
//                   Flexible(
//                       child:RaisedButton(
//                         onPressed: () async{
//
//                         },
//                         color: Colors.deepOrangeAccent,
//                         child: Text("SIGNUP",style: TextStyle(color: Colors.white,fontSize: 20)),
//                         //color: Colors.black12,
//                       ) ),
//                   Container(color: Colors.transparent,height: 20),
//                   InkWell(
//                     onTap: (){
//                       Navigator.push(context, MaterialPageRoute(
//                           builder: (context) => loginPage()));
//                     },
//                     child: Text("Already have an account?, press here to login",style: TextStyle(color: Colors.white),),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         )
//       ),
//     );
//   }
// }
class MyHomePage5 extends StatefulWidget {
  MyHomePage5({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePage5State createState() => _MyHomePage5State();
}

class _MyHomePage5State extends State<MyHomePage5> {

   final _auth = FirebaseAuth.instance;
   String email,password,firstName,lastName;


   _emailAlert(){
     showDialog(context: context,
         barrierDismissible: false,
         builder: (BuildContext context) {
           return AlertDialog(
             title: Text("Unable to sign up"),
             content: Text("email is already in use"),
             actions: <Widget>[
               FlatButton(onPressed: () => Navigator.of(context).pop(),
                   child: Text("OK"))
             ],
           );
         }
     );
   }
   _signupAlert(){
     showDialog(context: context,
         barrierDismissible: false,
         builder: (BuildContext context) {
           return AlertDialog(
             title: Text("Unable to signup"),
             content: Text("Please fill in all information,password must be longer then 6 characters"),
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
                  Container(color: Colors.transparent,height: 50),
              Flexible(
              child: Container(
              margin: const EdgeInsets.all(10),
              child:TextFormField(
                onChanged: (x){
                  firstName=x;
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: "Enter Firstname",
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
            )
              ),
              Flexible(
              child: Container(
              margin: const EdgeInsets.all(10),
              child:TextFormField(
                onChanged: (x){
                  lastName=x;
                },
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.white),
              hintText: "Enter Lastname",
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
              )
              ),
              Flexible(
                child:Container(
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
                )
              ),
              Flexible(
                child:Container(
                  margin: const EdgeInsets.all(10),
                  child:TextFormField(
                    onChanged: (x){
                      password = x;
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
                )
              ),
                  Container(color: Colors.transparent,height: 40),
                  Flexible(
                      child:RaisedButton(
                        onPressed: () async{
                          if(email == null || password == null || firstName == null || lastName == null || password.length<6){
                            _signupAlert();
                          }
                          else{
                            try{
                              final result = await _auth.createUserWithEmailAndPassword(email: email.toString().trim(), password: password.toString().trim());

                              if(result != null){
                                FirebaseFirestore.instance.collection("users").doc(result.user.uid).set({
                                  "email" : email,
                                  "firstName" : firstName,
                                  "lastName" : lastName
                                });
                                Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage1(uid: result.user.uid)));
                              }
                            }catch(e){
                              _emailAlert();
                            }
                          }


                        },
                        color: Colors.deepOrangeAccent,
                        child: Text("SIGNUP",style: TextStyle(color: Colors.white,fontSize: 20)),
                        //color: Colors.black12,
                      ) ),
                  Container(color: Colors.transparent,height: 20),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => MyHomePage6()));
                    },
                    child: Text("Already have an account?, press here to login",style: TextStyle(color: Colors.white),),
                  )
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}