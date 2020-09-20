import 'package:flutter/material.dart';
import 'package:flutter_app/activityDetail.dart';
import 'package:flutter_app/recommendation_activity.dart';

class RecommendedActivityPage extends StatefulWidget {
  RecommendedActivityPage({Key key, this.title, this.recommendation})
      : super(key: key);
  final String title;
  RecommendationActivity recommendation;
  @override
  _RecommendedActivityPageState createState() =>
      _RecommendedActivityPageState();
}

class _RecommendedActivityPageState extends State<RecommendedActivityPage> {
  void initState() {
    super.initState();
    widget.recommendation.get_recommended_activities().then((rec_map) {
      setState(() {
        activityList = rec_map;
        //print(activityList);
      });
    }).catchError((e) {
      //print("Failed to load the data." + e.toString());
    });
  }

  var activityList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 243, 231, 100),
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        leading: Container(),
        backgroundColor: Color.fromRGBO(255, 180, 105, 100),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[],
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: activityList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: () {
                        //print("clicked!");
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
