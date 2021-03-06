import 'package:flutter/material.dart';
import 'package:flutter_app/routeScreen.dart';
import 'signupScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'recommendation_activity.dart';
import 'recommendation.dart';


void main() {
  // File path to a file in the current directory

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "陪陪养育",
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.orange,
        //brightness: Brightness.dark,
        primaryColor: Colors.orangeAccent[800],
        accentColor: Colors.deepOrangeAccent[600],
      ),
      home: MyHomePage(title: "陪陪养育"),
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
  var loading = true;
  double _progressValue = 0.0;
  RecommendationActivity recommendation_activity = RecommendationActivity();
  Recommendation food_recommendation = Recommendation();

  void _updateProgress() {
    const oneSec = const Duration(seconds: 1);
    new Timer.periodic(oneSec, (Timer t) {
      setState(() {
        _progressValue += .1;
        // we "finish" downloading here
        if (_progressValue.toStringAsFixed(1) == '1.0') {
          t.cancel();
          SharedPreferences.getInstance().then((prefs) {
            var isSaved = prefs.getBool("saved");
            print(isSaved);
            if (isSaved != null && isSaved) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RoutePage(title: '??? Page',recommendationActivity: recommendation_activity,foodRecommendation: food_recommendation,)),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SignUpPage(title: '注册',recommendationActivity: recommendation_activity,foodRecommendation: food_recommendation,)),
              );
            }
          });
          loading = false;
          return;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();

    _updateProgress();
//    Timer(Duration(seconds: 4), () {
//      SharedPreferences.getInstance().then((prefs) {
//        var isSaved = prefs.getBool("saved");
//        print(isSaved);
//        if (isSaved != null && isSaved) {
//          Navigator.push(
//            context,
//            MaterialPageRoute(
//                builder: (context) => MyThirdPage(title: '??? Page')),
//          );
//        } else {
//          Navigator.push(
//            context,
//            MaterialPageRoute(
//                builder: (context) => MyNextPage(title: 'Second Page')),
//          );
//        }
//      });
      // add 152-166 here
//    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * .1;
    double height = MediaQuery.of(context).size.height * .1;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.

        //backgroundColor: Color.fromRGBO( , g, b, opacity),
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      flex: 8,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 6,
                            child: Tab(
                              icon: Image.asset("assets/logo2.jpg"),
//                          iconMargin: EdgeInsets.only(
//                              left: width, right: width, top: height),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Text(
                              "陪陪养育",
                              style: Theme.of(context).textTheme.display1,
                            ),
                          ),
                        ],
                      )),
                  Visibility(
                      visible: loading,
                      child: Expanded(flex: 1, child: Text('loading...'))),
                  Visibility(
                    visible: loading,
                    child: Expanded(
                      flex: 1,
                      child: Container(
                          margin: EdgeInsets.only(bottom: height / 2),
                          padding: EdgeInsets.only(left: width, right: width),
                          child: LinearProgressIndicator(
                            value: _progressValue,
                          )),
                    ),
                  ),
                  Visibility(
                    visible: loading,
                    child: Expanded(
                        flex: 1,
                        child: Container(
                            alignment: Alignment.topCenter,
                            child: Text('${(_progressValue * 100).round()}%'))),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
//// Copyright 2017 The Chromium Authors. All rights reserved.
//// Use of this source code is governed by a BSD-style license that can be
//// found in the LICENSE file.
//
//import 'package:flutter/material.dart';
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: DefaultTabController(
//        length: choices.length,
//        child: Scaffold(
//          appBar: AppBar(
//            bottom: TabBar(
//              isScrollable: true,
//              tabs: choices.map((Choice choice) {
//                return
//                  Container(
//                    width: 150,
//                    child: Center(
//                      child: Tab(
//                        text: choice.title,
//
////                  icon: Icon(choice.icon),
//                      ),
//                    ),
//                  );
//              }).toList(),
//            ),
//          ),
//          body: TabBarView(
//            children: choices.map((Choice choice) {
//              return Padding(
//                padding: const EdgeInsets.all(16.0),
//                child: ChoiceCard(choice: choice),
//              );
//            }).toList(),
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//class Choice {
//  const Choice({this.title, this.icon});
//
//  final String title;
//  final IconData icon;
//}
//
//const List<Choice> choices = const <Choice>[
//
//  const Choice(title: '推荐菜单'),
//  const Choice(title: '记录菜单 '),
//];
//
//class ChoiceCard extends StatelessWidget {
//  const ChoiceCard({Key key, this.choice}) : super(key: key);
//
//  final Choice choice;
//
//  @override
//  Widget build(BuildContext context) {
//    final TextStyle textStyle = Theme.of(context).textTheme.headline4;
//    return Card(
//      color: Colors.white,
//      child: Center(
//        child: Column(
//          mainAxisSize: MainAxisSize.min,
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: <Widget>[
//            Icon(choice.icon, size: 128.0, color: textStyle.color),
//            Text(choice.title, style: textStyle),
//          ],
//        ),
//      ),
//    );
//  }
//}
//
//void main() {
//  runApp(MyApp());
//}
