import 'package:flutter/material.dart';
import 'package:flutter_app/recommendation.dart';

class FoodDetailPage extends StatefulWidget {
  FoodDetailPage({Key key, this.recommendation, this.foodId}) : super(key: key);

  Recommendation recommendation;
  String foodId;

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  var food_details = ["calories", "protein", "fat", "carbohydrates","unit"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Color.fromRGBO(255, 243, 231, 100),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Container(
                  color: Color.fromRGBO(255, 214, 214, 100),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 80,
                          width: 80,
                          alignment: Alignment.centerRight,
                          child: Image.network(widget
                              .recommendation.food_map[widget.foodId]['image']),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 10, right: 30, top: 100, bottom: 100),
                          child: Text(
                              widget.recommendation.food_map[widget.foodId]['name'],
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 30)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  child: ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemCount: food_details.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(left: 30, right: 30),
                        height: 50,
                        color: Color.fromRGBO(255, 223, 191, 100),
                        child: Text(
                          food_details[index].toUpperCase() +
                              '     :   ' +
                              widget.recommendation.food_map[widget.foodId]
                                  [food_details[index]],
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 20),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
