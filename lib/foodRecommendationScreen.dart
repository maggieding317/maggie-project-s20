import 'package:flutter/material.dart';
import 'package:flutter_app/recommendation.dart';
import 'food_detail.dart';
import 'recommendation.dart';

class FoodRecommendationPage extends StatefulWidget {
  FoodRecommendationPage({Key key, this.title, this.recommendation})
      : super(key: key);

  final String title;
  Recommendation recommendation;

  @override
  _FoodRecommendationPageState createState() => _FoodRecommendationPageState();
}

class _FoodRecommendationPageState extends State<FoodRecommendationPage> {
  var breakfastList = [];

  var lunchList = [];

  var dinnerList = [];

  double calories = 0.0;

  double protein = 0.0;

  double fat = 0.0;

  double carbohydrate = 0.0;

  @override
  void initState() {
    super.initState();
    widget.recommendation.get_recommended_food().then((rec_map) {
      setState(() {
        breakfastList = rec_map['breakfast'];
        lunchList = rec_map['lunch'];
        dinnerList = rec_map['dinner'];
      });
      calculateNutrition(breakfastList);
      calculateNutrition(lunchList);
      calculateNutrition(dinnerList);
    }).catchError((e) {
      print("Failed to load the data." + e.toString());
    });
  }

  void calculateNutrition(list) {
    calculateCalories(list);
    calculateProtein(list);
    calculateFat(list);
    calculateCarbohydrate(list);
  }

  void calculateCalories(list) {
    var temp = 0.0;
    for (int i = 0; i < list.length; i++) {
      temp += double.parse(widget.recommendation.food_map[list[i]]['calories']);
    }
    setState(() {
      calories += temp;
    });
    print('calories' + calories.toString());
  }

  void calculateProtein(list) {
    var temp = 0.0;
    for (int i = 0; i < list.length; i++) {
      temp += double.parse(widget.recommendation.food_map[list[i]]['protein']);
    }
    setState(() {
      protein += temp;
    });
    //print('calories' + calories.toString());
  }

  void calculateFat(list) {
    var temp = 0.0;
    for (int i = 0; i < list.length; i++) {
      temp += double.parse(widget.recommendation.food_map[list[i]]['fat']);
    }
    setState(() {
      fat += temp;
    });
    //print('calories' + calories.toString());
  }

  void calculateCarbohydrate(list) {
    var temp = 0.0;
    for (int i = 0; i < list.length; i++) {
      temp += double.parse(
          widget.recommendation.food_map[list[i]]['carbohydrates']);
    }
    setState(() {
      carbohydrate += temp;
    });
    print('carbohydrate' + temp.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Color.fromRGBO(255, 180, 105, 100),
//        elevation: 0.0,
//        title: Text(widget.title),
//      ),
      body: Center(
        child: Container(
          color: Color.fromRGBO(255, 243, 231, 100),
          child: Column(
            children: <Widget>[
              SizedBox(height: 8.0),
              Text(
                'Total Calories: ' + calories.toStringAsFixed(2),
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 8.0),
              Text(
                'Total Protein: ' + protein.toStringAsFixed(2),
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 8.0),
              Text(
                'Total Fat: ' + fat.toStringAsFixed(2),
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 8.0),
              Text(
                'Total Carbohydrate: ' + carbohydrate.toStringAsFixed(2),
                style: TextStyle(fontSize: 20),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(left: 50, top: 30, bottom: 30),
                      child: Text(
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
                          child: FlatButton(
                              child: Row(children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    child: Image.network(widget.recommendation
                                            .food_map[breakfastList[index]]
                                        ['image']),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin: EdgeInsets.only(right: 30),
                                    child: Text(
                                      breakfastList[index],
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ]),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FoodDetailPage(
                                            foodId: breakfastList[index],
                                            recommendation:
                                                widget.recommendation,
                                          )),
                                );
                              }),
                        ),
                      );
                    }),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(left: 50, top: 30, bottom: 30),
                      child: Text(
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
                          child: FlatButton(
                              child: Row(children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    child: Image.network(widget.recommendation
                                        .food_map[lunchList[index]]['image']),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin: EdgeInsets.only(right: 30),
                                    child: Text(
                                      lunchList[index],
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ]),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FoodDetailPage(
                                            foodId: lunchList[index],
                                            recommendation:
                                                widget.recommendation,
                                          )),
                                );
                              }),
                        ),
                      );
                    }),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(left: 50, top: 30, bottom: 30),
                      child: Text(
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
                          child: FlatButton(
                              child: Row(children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    child: Image.network(widget.recommendation
                                        .food_map[dinnerList[index]]['image']),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin: EdgeInsets.only(right: 30),
                                    child: Text(
                                      dinnerList[index],
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ]),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FoodDetailPage(
                                            foodId: dinnerList[index],
                                            recommendation:
                                                widget.recommendation,
                                          )),
                                );
                              }),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
