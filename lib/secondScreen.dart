import 'package:flutter/material.dart';
import 'thirdScreen.dart';

class MyNextPage extends StatefulWidget {
  MyNextPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyNextPageState createState() => _MyNextPageState();
}

class _MyNextPageState extends State<MyNextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Welcome"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:CrossAxisAlignment.center,

              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(right: 30),
                    child:Text(
                      "ID",
                      textAlign: TextAlign.right,
                    ),
                  ),

                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(right: 30,left: 30,top:15,bottom:15),
                    child: TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'ID',
                      ),
                    ),
                  ),
                ),

              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(right: 30),
                    child:Text(
                      "体重",
                      textAlign: TextAlign.right,
                    ),
                  ),

                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(right: 30,left: 30,top:15,bottom: 15),
                    child: TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '体重',
                      ),
                    ),
                  ),
                ),

              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(right: 30),
                    child:Text(
                      "身高",
                      textAlign: TextAlign.right,
                    ),
                  ),

                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(right: 30,left: 30,top:15,bottom: 15),
                    child: TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '身高',
                      ),
                    ),
                  ),
                ),

              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(right: 30),
                    child:Text(
                      "头围",
                      textAlign: TextAlign.right,
                    ),
                  ),

                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(right: 30,left: 30,top:15,bottom: 15),
                    child: TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '头围',
                      ),
                    ),
                  ),
                ),

              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(right: 30),
                    child:Text(
                      "性别",
                      textAlign: TextAlign.right,
                    ),
                  ),

                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(right: 30,left: 30,top:15,bottom: 15),
                    child: TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '性别',
                      ),
                    ),
                  ),
                ),

              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(right: 30),
                    child:Text(
                      "年龄",
                      textAlign: TextAlign.right,
                    ),
                  ),

                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(right: 30,left: 30,top:15,bottom: 15),
                    child: TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '年龄',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyThirdPage(title: 'Third Page')),
                );
              },
              child:
                  const Text('Next', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
