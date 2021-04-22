import 'package:flutter/material.dart';
import 'package:mobile_final_project/Views/login.dart';
import 'package:mobile_final_project/Views/signup.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
                child:Opacity(
                  opacity: 0.4,
                    child:Image.asset('assets/background.jpg',
                      fit: BoxFit.cover,
                    )
                )
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(color: Colors.transparent,height: 75),
                  Image(image: AssetImage('assets/logo_picshare.png'),height: 300,width: 300),
                  Container(color: Colors.transparent,height: 50),
                      RaisedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => MyHomePage5()));
                      },
                          color: Colors.deepOrangeAccent,
                          child: Text("SIGNUP",style: TextStyle(color: Colors.white,fontSize: 20))
                      ),
                      Container(color: Colors.transparent,width: 10),
                      RaisedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => MyHomePage6()));
                      },
                          color: Colors.deepOrangeAccent,
                          child: Text("LOGIN",style: TextStyle(color: Colors.white,fontSize: 20))
                      ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
