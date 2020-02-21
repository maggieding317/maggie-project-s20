import 'package:flutter/material.dart';

class MyFifthPage extends StatefulWidget {
  MyFifthPage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyFifthPageState createState() => _MyFifthPageState();
}

class _MyFifthPageState extends State<MyFifthPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(

        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left:30, top: 50,bottom: 30),
                    child:Text(
                      "8:00am",
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: FlatButton(
                      onPressed: () {
                        /*...*/
                      },
                      child: Text(
                        "Flat Button",
                      ),
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
                    margin: EdgeInsets.only(left:30, top: 30,bottom: 30),
                    child:Text(
                      "10:00am",
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: FlatButton(
                      onPressed: () {
                        /*...*/
                      },
                      child: Text(
                        "Flat Button",
                      ),
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
                    margin: EdgeInsets.only(left:30, top: 30,bottom: 30),
                    child:Text(
                      "12:00am",
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: FlatButton(
                      onPressed: () {
                        /*...*/
                      },
                      child: Text(
                        "Flat Button",
                      ),
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
                    margin: EdgeInsets.only(left:30, top: 30,bottom: 30),
                    child:Text(
                      "1:00pm",
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: FlatButton(
                      onPressed: () {
                        /*...*/
                      },
                      child: Text(
                        "Flat Button",
                      ),
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
                    margin: EdgeInsets.only(left:30, top: 30,bottom: 30),
                    child:Text(
                      "3:00pm",
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: FlatButton(
                      onPressed: () {
                        /*...*/
                      },
                      child: Text(
                        "Flat Button",
                      ),
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
                    margin: EdgeInsets.only(left:30, top: 30,bottom: 30),
                    child:Text(
                      "5:00pm",
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: FlatButton(
                      onPressed: () {
                        /*...*/
                      },
                      child: Text(
                        "Flat Button",
                      ),
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
                    margin: EdgeInsets.only(left:30, top: 30,bottom: 30),
                    child:Text(
                      "6:00pm",
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: FlatButton(
                      onPressed: () {
                        /*...*/
                      },
                      child: Text(
                        "Flat Button",
                      ),
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
                    margin: EdgeInsets.only(left:30, top: 30,bottom: 30),
                    child:Text(
                      "8:00pm",
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: FlatButton(
                      onPressed: () {
                        /*...*/
                      },
                      child: Text(
                        "Flat Button",
                      ),
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
