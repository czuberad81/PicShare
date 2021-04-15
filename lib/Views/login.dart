import 'package:flutter/material.dart';
import 'package:mobile_final_project/Views/home.dart';
// ignore: camel_case_types
class loginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
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
                        child:TextField(
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
                        child:TextField(
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
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => MyHomePage1()));
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