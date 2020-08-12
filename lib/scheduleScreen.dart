import 'package:flutter/material.dart';
import 'recommendation_schedule.dart';
import 'recommendation_activity.dart';
import 'activityDetail.dart';

class SchedulePage extends StatefulWidget {
  SchedulePage({Key key, this.title,this.recommendationActivity}) : super(key: key);

  RecommendationActivity recommendationActivity;

  final String title;

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  var recommendation;
  var activityList =[];
  void initState() {
    super.initState();
    recommendation = RecommendataionSchedule(widget.recommendationActivity);
    recommendation.get_recommended_schedul().then((rec_map){
      setState(() {
        activityList = rec_map;
        print(activityList);
      });
    }).catchError((e) {
      print("Failed to load the data." + e.toString());
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 243, 231, 100),

      body: Center(

        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(top: 30,bottom: 30),
                    child:Text(
                      "日程表",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),


              ],
            ),


            Expanded(
              child: ListView.builder(
                  //padding: const EdgeInsets.all(1),
                  itemCount: activityList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: (){
                        print("clicked!");
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ActivityDetailPage(activityid: activityList[index]['name'])),
                        );
                      },
                      title:Container(
                        child: Center(
                          child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    color: index %2 == 0 ? Color.fromRGBO(255, 223, 191, 100) :Color.fromRGBO(255, 243, 231, 100),
                                    height: 60,
                                    alignment: Alignment.center,
                                    child:Text(
                                      activityList[index]['time'],
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: index %2 == 1 ? Color.fromRGBO(255, 223, 191, 100) :Color.fromRGBO(255, 243, 231, 100),
                                    height: 60,
                                    width: 80,
                                    alignment: Alignment.center,
                                    child:
                                    Image.network(RecommendationActivity.activity_map[activityList[index]['name']]['image']),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    color: index %2 == 1 ? Color.fromRGBO(255, 223, 191, 100) :Color.fromRGBO(255, 243, 231, 100),
                                    margin: EdgeInsets.only(right: 30),
                                    height: 60,
                                    alignment: Alignment.center,
                                    child:Text(
                                      RecommendationActivity.activity_map[activityList[index]['name']]['name'],
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),

                              ]
                          ),
                        ),
                      ),
                    );
                  }
              ),
            ),

          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
