import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'foodList.dart';
import 'foodRecommendationScreen.dart';
import 'food_detail.dart';
import 'recommendation.dart';

class yourFoodPage extends StatefulWidget {
  yourFoodPage({Key key, this.title, this.foodRecommendation})
      : super(key: key);

  Recommendation foodRecommendation;
  final String title;

  @override
  _yourFoodPageState createState() => _yourFoodPageState();
}

class _yourFoodPageState extends State<yourFoodPage> {
  var breakfastList = [];

  var lunchList = [];

  var dinnerList = [];

  var calories = 0.0;
  _navigateAndDisplaySelection(BuildContext context, String meal) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.

    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(
          builder: (context) => FoodList(
            title: "Food List",
            foodRecommendation: widget.foodRecommendation,
          )),
    );
    print(result);
    setState(() {
      if (meal == "breakfast") {
        breakfastList.add(result);
        Recommendation.recordFoodToday("breakfast", breakfastList);
      }
      if (meal == "lunch") {
        lunchList.add(result);
        Recommendation.recordFoodToday("lunch", lunchList);
      }
      if (meal == "dinner") {
        dinnerList.add(result);
        Recommendation.recordFoodToday("dinner", dinnerList);
      }

      print(widget.foodRecommendation.food_map[result]['name']['calories']);
      calories += double.parse(widget.foodRecommendation.food_map[result]['name']['calories']);
    });
  }

  @override
  void initState() {
    super.initState();
    Recommendation.loadFoodToday("breakfast").then((list) {
      setState(() {
        for (var item in list) {
          if (item != null) {
            breakfastList.add(item);
            print(list);
          }
        }
      });
      calculateCalories(breakfastList);
    });
    Recommendation.loadFoodToday("lunch").then((list) {
      this.lunchList = list;
      calculateCalories(lunchList);
    });
    Recommendation.loadFoodToday("dinner").then((list) {
      this.dinnerList = list;
      calculateCalories(dinnerList);
    });
  }

  void calculateCalories(list) {

    var temp = 0.0;
    for (int i = 0; i < list.length; i++) {
      temp += double.parse(widget
          .foodRecommendation.food_map[list[i]['name']]['calories']);
    }
    setState(() {
      calories += temp;
    });
    print('calories' + calories.toString());


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            color: Color.fromRGBO(255, 243, 231, 100),
            child: Column(
              children: <Widget>[
                Text("calories: " + calories.toStringAsFixed(2)),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 50, top: 30, bottom: 30),
                        child: Text(
                          "早餐",
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        _navigateAndDisplaySelection(
                            context, "breakfast");
                      },
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
                            child: Row(children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  child: Image.network(
                                      breakfastList[index]['image']),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: FlatButton(
                                  child: Container(
                                    margin: EdgeInsets.only(right: 30),
                                    child: Text(
                                      breakfastList[index]['name'],
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => FoodDetailPage(
                                              foodId: breakfastList[index]['name'],
                                              recommendation:
                                              widget.foodRecommendation,
                                            )),
                                      );
                                    }
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      setState(() {
                                        calories -= double.parse(widget
                                            .foodRecommendation.food_map[breakfastList[index]['name']]['calories']);breakfastList.removeAt(index);
                                        Recommendation.recordFoodToday(
                                            "breakfast", breakfastList);
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        );
                      }),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 50, top: 30, bottom: 30),
                        child: Text(
                          "午餐",
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        _navigateAndDisplaySelection(context, "lunch");
                      },
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
                            child: Row(children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  child: Image.network(
                                      lunchList[index]['image']),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: FlatButton(
                                  child: Container(
                                    margin: EdgeInsets.only(right: 30),
                                    child: Text(
                                      lunchList[index]['name'],
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => FoodDetailPage(
                                              foodId: lunchList[index]['name'],
                                              recommendation:
                                              widget.foodRecommendation,
                                            )),
                                      );
                                    }
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      setState(() {
                                        calories -= double.parse(widget
                                            .foodRecommendation.food_map[lunchList[index]['name']]['calories']);
                                        lunchList.removeAt(index);
                                        Recommendation.recordFoodToday(
                                            "lunch", lunchList);
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        );
                      }),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 50, top: 30, bottom: 30),
                        child: Text(
                          "晚餐",
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        _navigateAndDisplaySelection(context, "dinner");
                      },
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
                            child: Row(children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  child: Image.network(
                                      dinnerList[index]['image']),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: FlatButton(
                                  child: Container(
                                    margin: EdgeInsets.only(right: 30),
                                    child: Text(
                                      dinnerList[index]['name'],
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => FoodDetailPage(
                                              foodId: dinnerList[index]['name'],
                                              recommendation:
                                              widget.foodRecommendation,
                                            )),
                                      );
                                    }
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      setState(() {
                                        calories -= double.parse(widget
                                            .foodRecommendation.food_map[dinnerList[index]['name']]['calories']);
                                        dinnerList.removeAt(index);
                                        Recommendation.recordFoodToday(
                                            "dinner", dinnerList);
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),

        ));
  }
}
