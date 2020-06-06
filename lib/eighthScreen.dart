import 'package:flutter/material.dart';
import 'package:flutter_app/activityDetail.dart';
import 'package:flutter_app/recommendation_activity.dart';

class MyEighthPage extends StatefulWidget {
  MyEighthPage({Key key, this.title, this.recommendation}) : super(key: key);
  final String title;
  RecommendationActivity recommendation;
  @override
  _MyEighthPageState createState() => _MyEighthPageState();
}

class _MyEighthPageState extends State<MyEighthPage> {
  void initState() {
    super.initState();
    widget.recommendation.get_recommended_activities().then((rec_map) {
      setState(() {
        activityList = rec_map;
        print('acti');
        print(activityList);
      });
    }).catchError((e) {
      print("Failed to load the data." + e.toString());
    });
  }

  var activityList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(left: 50, top: 30, bottom: 30),
                    child: Text(
                      "Recommended Activity",
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: activityList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: () {
                        print("clicked!");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ActivityDetailPage(
                                  activityid: activityList[index])),
                        );
                      },
                      title: Container(
                        height: 50,
                        child: Center(
                          child: Row(children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 80,
                                width: 80,
                                child: Image.network(RecommendationActivity
                                        .activity_map[activityList[index]]
                                    ['image']),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                margin: EdgeInsets.only(right: 30),
                                child: Text(
                                  RecommendationActivity
                                          .activity_map[activityList[index]]
                                      ['name'],
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
