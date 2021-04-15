import 'package:flutter/material.dart';

// ignore: camel_case_types
// class homePage extends StatelessWidget{
//   int _cIndex = 1;
//   @override
//   Widget build(BuildContext context){
//     return new Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _cIndex,
//         items:[
//           BottomNavigationBarItem(icon: Icon(Icons.add_a_photo_outlined),title: Text('Account')),
//           BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
//           BottomNavigationBarItem(icon: Icon(Icons.person_search_outlined),title: Text('Search'))
//         ],
//         onTap: (x){
//
//         },
//       ),
//
//     );
//   }
// }
class MyHomePage1 extends StatefulWidget {
  MyHomePage1({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePage1State createState() => _MyHomePage1State();
}

class _MyHomePage1State extends State<MyHomePage1> {
  int _cIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _cIndex,
        items:[
          BottomNavigationBarItem(icon: Icon(Icons.add_a_photo_outlined),title: Text('Account')),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.person_search_outlined),title: Text('Search'))
        ],
        onTap: (x){
          setState(() {
            _cIndex = x;
          });
        },
      ),
    );
  }
}