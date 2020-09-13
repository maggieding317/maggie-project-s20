import 'package:flutter/material.dart';
import 'package:flutter_app/recommendation_activity.dart';

class ActivityDetailPage extends StatefulWidget {
  ActivityDetailPage({Key key, this.activityid}) : super(key: key);
  final String activityid;

  @override
  _ActivityDetailPageState createState() => _ActivityDetailPageState();
}

class _ActivityDetailPageState extends State<ActivityDetailPage> {
  var recommendation = RecommendationActivity();

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
                    height: 80,
                    width: 80,
                    margin: EdgeInsets.only(right: 10),
                    alignment: Alignment.centerRight,
                    child: Image.network(RecommendationActivity
                        .activity_map[widget.activityid]['image']),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 10, right: 30, top: 100, bottom: 100),
                    child: Text(
                      RecommendationActivity.activity_map[widget.activityid]
                          ['name'],
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
                    margin: EdgeInsets.only(right: 30),
                    child: Text(
                      RecommendationActivity.activity_map[widget.activityid]
                          ['description'],
                      textAlign: TextAlign.center,
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
