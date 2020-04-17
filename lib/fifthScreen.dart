import 'package:flutter/material.dart';
import 'recommendation_schedule.dart';
import 'recommendation_activity.dart';
import 'activityDetail.dart';

class MyFifthPage extends StatefulWidget {
  MyFifthPage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyFifthPageState createState() => _MyFifthPageState();
}

class _MyFifthPageState extends State<MyFifthPage> {
  var recommendation = RecommendataionSchedule();
  var activityList =[];
  void initState() {
    super.initState();
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

      body: Center(

        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(left:50, top: 30,bottom: 30),
                    child:Text(
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
                      onTap: (){
                        print("clicked!");
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ActivityDetailPage(activityid: activityList[index])),
                        );
                      },
                      title:Container(
                        height: 50,
                        child: Center(
                          child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin: EdgeInsets.only(right: 30),
                                    child:Text(
                                      activityList[index]['time'],
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    child:
                                    Image.network(RecommendataionActivity.acitivity_map[activityList[index]['name']]['image']),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin: EdgeInsets.only(right: 30),
                                    child:Text(
                                      RecommendataionActivity.acitivity_map[activityList[index]['name']]['name'],
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
