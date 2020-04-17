import 'package:flutter/material.dart';
import 'package:flutter_app/secondScreen.dart';

class MySixthPage extends StatefulWidget {
  MySixthPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MySixthPageState createState() => _MySixthPageState();
}

class _MySixthPageState extends State<MySixthPage> {


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

                    margin: EdgeInsets.only(right: 10),
                    alignment: Alignment.centerRight,
                    child:
                    CircleAvatar(
                      backgroundImage: NetworkImage("https://cdn4.iconfinder.com/data/icons/small-n-flat/24/user-alt-512.png"),
                      radius: 40,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(left:10, right: 30,top: 100,bottom: 100),
                    child:Text(
                      "Name",
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
                    margin: EdgeInsets.only(right: 20),
                    alignment: Alignment.centerRight,
                    child:
                    Image(
                      image: AssetImage("assets/medium.jpg"),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left:10,right: 30),
                    child:Text(
                      "Name",
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
                    margin: EdgeInsets.only(top:50,right: 50),
                    child:Text(
                      "Name",
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left:50,top:50),
                    child:Text(
                      "Name",
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
                    margin: EdgeInsets.only(top:50,right: 50),
                    child:Text(
                      "Name",
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left:50,top:50,right: 30),
                    child:Text(
                      "",
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
                    margin: EdgeInsets.only(top:50,bottom: 50),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyNextPage(title: 'Second Page')),
                        );
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
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
