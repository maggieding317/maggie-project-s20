import 'package:flutter/material.dart';
import 'fifthScreen.dart';

class MyFourthPage extends StatefulWidget {
  MyFourthPage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyFourthPageState createState() => _MyFourthPageState();
}

class _MyFourthPageState extends State<MyFourthPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
           children: <Widget>[
             Row(
               children: <Widget>[
                 Expanded(
                   flex: 2,
                   child: Container(
                     margin: EdgeInsets.only(left:50, top: 30,bottom: 30),
                     child:Text(
                       "早餐",
                       textAlign: TextAlign.left,
                     ),
                   ),
                 ),
               ],
             ),

             Row(
                 children: <Widget>[
                   Expanded(
                     flex: 1,
                     child: Container(
                       height: 80,
                       width: 80,
                       child:
                       Image(
                         image: AssetImage("assets/medium.jpg"),
                       ),
                     ),
                   ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(right: 30),
                      child:Text(
                        "Name",
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
              ]
             ),

             Row(
                 children: <Widget>[
                   Expanded(
                     flex: 1,
                     child: Container(
                       height: 80,
                       width: 80,
                       child:
                       Image(
                         image: AssetImage("assets/medium.jpg"),
                       ),
                     ),
                   ),
                   Expanded(
                     flex: 2,
                     child: Container(
                       margin: EdgeInsets.only(right: 30),
                       child:Text(
                         "Name",
                         textAlign: TextAlign.left,
                       ),
                     ),
                   ),

                 ]
             ),

             Row(
                 children: <Widget>[
                   Expanded(
                     flex: 1,
                     child: Container(
                       height: 80,
                       width: 80,
                       child:
                       Image(
                         image: AssetImage("assets/medium.jpg"),
                       ),
                     ),
                   ),
                   Expanded(
                     flex: 2,
                     child: Container(
                       margin: EdgeInsets.only(right: 30),
                       child:Text(
                         "Name",
                         textAlign: TextAlign.left,
                       ),
                     ),
                   ),

                 ]
             ),

             Row(
               children: <Widget>[
                 Expanded(
                   flex: 2,
                   child: Container(
                     margin: EdgeInsets.only(left:50, top: 30,bottom: 30),
                     child:Text(
                       "午餐",
                       textAlign: TextAlign.left,
                     ),
                   ),
                 ),
               ],
             ),

             Row(
                 children: <Widget>[
                   Expanded(
                     flex: 1,
                     child: Container(
                       height: 80,
                       width: 80,
                       child:
                       Image(
                         image: AssetImage("assets/medium.jpg"),
                       ),
                     ),
                   ),
                   Expanded(
                     flex: 2,
                     child: Container(
                       margin: EdgeInsets.only(right: 30),
                       child:Text(
                         "Name",
                         textAlign: TextAlign.left,
                       ),
                     ),
                   ),
                 ]
             ),

             Row(
                 children: <Widget>[
                   Expanded(
                     flex: 1,
                     child: Container(
                       height: 80,
                       width: 80,
                       child:
                       Image(
                         image: AssetImage("assets/medium.jpg"),
                       ),
                     ),
                   ),
                   Expanded(
                     flex: 2,
                     child: Container(
                       margin: EdgeInsets.only(right: 30),
                       child:Text(
                         "Name",
                         textAlign: TextAlign.left,
                       ),
                     ),
                   ),
                 ]
             ),

             Row(
                 children: <Widget>[
                   Expanded(
                     flex: 1,
                     child: Container(
                       height: 80,
                       width: 80,
                       child:
                       Image(
                         image: AssetImage("assets/medium.jpg"),
                       ),
                     ),
                   ),
                   Expanded(
                     flex: 2,
                     child: Container(
                       margin: EdgeInsets.only(right: 30),
                       child:Text(
                         "Name",
                         textAlign: TextAlign.left,
                       ),
                     ),
                   ),
                 ]
             ),

             Row(
               children: <Widget>[
                 Expanded(
                   flex: 2,
                   child: Container(
                     margin: EdgeInsets.only(left:50, top: 30,bottom: 30),
                     child:Text(
                       "晚餐",
                       textAlign: TextAlign.left,
                     ),
                   ),
                 ),
               ],
             ),



          ],
        ),
      ),
    );
  }
}
