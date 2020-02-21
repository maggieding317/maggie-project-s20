import 'package:flutter/material.dart';

class MyEighthPage extends StatefulWidget {
  MyEighthPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyEighthPageState createState() => _MyEighthPageState();
}

class _MyEighthPageState extends State<MyEighthPage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(

        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 50,left: 50,top:50,),
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search',
                ),
              ),
            ),

          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
