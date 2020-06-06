import 'package:flutter/material.dart';
import 'package:flutter_app/eighthScreen.dart';
import 'package:flutter_app/fifthScreen.dart';
import 'package:flutter_app/seventhScreen.dart';
import 'package:flutter_app/sixthScreen.dart';
import 'fourthScreen.dart';
import 'package:flutter_app/recommendation_activity.dart';


class MyThirdPage extends StatefulWidget {
  MyThirdPage({Key key, this.title,this.recommendationActivity}) : super(key: key);


  final String title;
  RecommendationActivity recommendationActivity;


  @override
  _MyThirdPageState createState() => _MyThirdPageState();
}

class _MyThirdPageState extends State<MyThirdPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  List<Widget> _widgetOptions ;


  @override
  void initState() {
    super.initState();
    _widgetOptions= <Widget>[
    MySeventhPage(title: "7th page",),
    MyEighthPage(title: "8th page",recommendation: widget.recommendationActivity,),
    MyFifthPage(title: "5th page",recommendationActivity: widget.recommendationActivity,),
    MySixthPage(title: "6th page",recommendationAct: widget.recommendationActivity,),
    ];
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
//      appBar: AppBar(
//
//        title: Text(widget.title),
//      ),
      body: Center(

        child: _widgetOptions.elementAt(_selectedIndex),
//        Column(
//
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Expanded(
//              flex: 1,
//              child: Container(
//                margin: EdgeInsets.only(top:100,bottom:20),
//                child:RaisedButton(
//                  onPressed: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context) => MyFourthPage(title: 'Fourth Page')),
//                    );
//                  },
//                  child: const Text(
//                      '         Enabled Button        ',
//                      style: TextStyle(fontSize: 20)
//                  ),
//                ),
//              ),
//            ),
//            Expanded(
//              flex: 1,
//              child: Container(
//                margin: EdgeInsets.only(top:20,bottom:100),
//                child:RaisedButton(
//                  onPressed: () {
//                    Navigator.push(
//                        context,
//                        MaterialPageRoute(builder: (context) => MyFifthPage(title: 'Fifth Page')),
//                    );
//                  },
//                  child: const Text(
//                      '         Enabled Button         ',
//                      style: TextStyle(fontSize: 20)
//                  ),
//                ),
//              ),
//            ),
//
//
//          ],
//        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('饮食'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('活动'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('日程表'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text('个人'),
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
