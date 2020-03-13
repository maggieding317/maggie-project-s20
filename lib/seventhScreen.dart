import 'package:flutter/material.dart';
import 'package:flutter_app/fifthScreen.dart';
import 'package:flutter_app/yourFoodScreen.dart';
import 'fourthScreen.dart';


class MySeventhPage extends StatefulWidget {
  MySeventhPage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MySeventhPageState createState() => _MySeventhPageState();
}

class _MySeventhPageState extends State<MySeventhPage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(

        child: Column(


          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(top:100,bottom:20),
                child:RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyFourthPage(title: 'Fourth Page')),
                    );
                  },
                  child: const Text(
                      '         Enabled Button        ',
                      style: TextStyle(fontSize: 20)
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(top:20,bottom:100),
                child:RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => yourFoodPage(title: 'Your Food Page')),
                    );
                  },
                  child: const Text(
                      '         Enabled Button         ',
                      style: TextStyle(fontSize: 20)
                  ),
                ),
              ),
            ),


          ],
        ),
      ),

    );
  }
}
