import 'package:flutter/material.dart';
import 'package:flutter_app/recommendation_activity.dart';

class MyEighthPage extends StatefulWidget {
  MyEighthPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyEighthPageState createState() => _MyEighthPageState();
}

class _MyEighthPageState extends State<MyEighthPage> {
  var recommendation = RecommendataionActivity();
  void initState() {
    super.initState();
    recommendation.get_recommended_activities().then((rec_map){
      setState(() {
        activityList = rec_map;
        print(activityList);
      });
    }).catchError((e) {
      print("Failed to load the data." + e.toString());
    });
  }

  var activityList = [


];



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
                      "Food List",
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
                        Navigator.pop(context,activityList[index]);
                      },
                      title:Container(
                        height: 50,
                        child: Center(
                          child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    child:
                                    Image.network(RecommendataionActivity.acitivity_map[activityList[index]]['image']),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin: EdgeInsets.only(right: 30),
                                    child:Text(
                                      RecommendataionActivity.acitivity_map[activityList[index]]['name'],
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
