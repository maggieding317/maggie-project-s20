import 'package:flutter/material.dart';
import 'package:flutter_app/scheduleScreen.dart';
import 'package:flutter_app/yourFoodScreen.dart';
import 'foodRecommendationScreen.dart';
import 'recommendation.dart';


class FoodPage extends StatefulWidget {
  FoodPage({Key key, this.title,this.foodRecommendation}) : super(key: key);

  Recommendation foodRecommendation;
  final String title;

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 243, 231, 100),

      body: Center(

        child: Column(


          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(top:100,bottom:20),
                child:RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FoodRecommendationPage(title: '推荐菜单',recommendation: widget.foodRecommendation,)),
                    );
                  },
                  child: const Text(
                      '         推荐菜单        ',
                      style: TextStyle(fontSize: 20)
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(top:20,bottom:100),
                child:RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => yourFoodPage(title: '记录菜单',foodRecommendation: widget.foodRecommendation,)),
                    );
                  },
                  child: const Text(
                      '         记录菜单         ',
                      style: TextStyle(fontSize: 20)
                  ),
                ),
              ),
            ),


          ],
        ),
      ),

    );
  }
}
