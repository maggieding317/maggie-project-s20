import 'package:flutter/material.dart';
import 'package:flutter_app/recommendation.dart';
import 'fifthScreen.dart';
import 'recommendation.dart';

class MyFourthPage extends StatefulWidget {
  MyFourthPage({Key key, this.title,this.recommendation}) : super(key: key);

  final String title;
  Recommendation recommendation;


  @override
  _MyFourthPageState createState() => _MyFourthPageState();
}

class _MyFourthPageState extends State<MyFourthPage> {


  var breakfastList = [ ];

  var lunchList = [ ];

  var dinnerList = [ ];

  @override
  void initState() {
    super.initState();
    widget.recommendation.get_recommended_food().then((rec_map){
      setState(() {
        breakfastList = rec_map['breakfast'];
        lunchList = rec_map['lunch'];
        dinnerList = rec_map['dinner'];
      });
    }).catchError((e) {
      print("Failed to load the data." + e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
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
                       "早餐",
                       textAlign: TextAlign.left,
                     ),
                   ),
                 ),
               ],
             ),
             

             Expanded(
               child: ListView.builder(
                   padding: const EdgeInsets.all(8),
                   itemCount: breakfastList.length,
                   itemBuilder: (BuildContext context, int index) {
                     return Container(
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
                                     Image.network(widget.recommendation.food_map[breakfastList[index]]['image']),
                                   ),
                                 ),
                                 Expanded(
                                   flex: 2,
                                   child: Container(
                                     margin: EdgeInsets.only(right: 30),
                                     child:Text(
                                       widget.recommendation.food_map[breakfastList[index]]['name'],
                                       textAlign: TextAlign.left,
                                     ),
                                   ),
                                 ),

                               ]
                           ),
                       ),
                     );
                   }
               ),
             ),


             Row(
               children: <Widget>[
                 Expanded(
                   flex: 2,
                   child: Container(
                     margin: EdgeInsets.only(left:50, top: 30,bottom: 30),
                     child:Text(
                       "午餐",
                       textAlign: TextAlign.left,
                     ),
                   ),
                 ),
               ],
             ),

             Expanded(
               child: ListView.builder(
                   padding: const EdgeInsets.all(8),
                   itemCount: lunchList.length,
                   itemBuilder: (BuildContext context, int index) {
                     return Container(
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
                                    Image.network(widget.recommendation.food_map[lunchList[index]]['image']),
                                 ),
                               ),
                               Expanded(
                                 flex: 2,
                                 child: Container(
                                   margin: EdgeInsets.only(right: 30),
                                   child:Text(
                                     widget.recommendation.food_map[lunchList[index]]['name'],
                                     textAlign: TextAlign.left,
                                   ),
                                 ),
                               ),

                             ]
                         ),
                       ),
                     );
                   }
               ),
             ),

             Row(
               children: <Widget>[
                 Expanded(
                   flex: 2,
                   child: Container(
                     margin: EdgeInsets.only(left:50, top: 30,bottom: 30),
                     child:Text(
                       "晚餐",
                       textAlign: TextAlign.left,
                     ),
                   ),
                 ),
               ],
             ),

             Expanded(
               child: ListView.builder(
                   padding: const EdgeInsets.all(8),
                   itemCount: dinnerList.length,
                   itemBuilder: (BuildContext context, int index) {
                     return Container(
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
                                   Image.network(widget.recommendation.food_map[dinnerList[index]]['image']),
                                 ),
                               ),
                               Expanded(
                                 flex: 2,
                                 child: Container(
                                   margin: EdgeInsets.only(right: 30),
                                   child:Text(
                                     widget.recommendation.food_map[dinnerList[index]]['name'],
                                     textAlign: TextAlign.left,
                                   ),
                                 ),
                               ),

                             ]
                         ),
                       ),
                     );
                   }
               ),
             ),



           ],
        ),
      ),
    );
  }
}
