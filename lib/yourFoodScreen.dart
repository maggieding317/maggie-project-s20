import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  var protein = 0.0;

  var fat = 0.0;

  var carbohydrate = 0.0;

  var dailycalories = 0.0;

  var dailyprotein = 0.0;

  var dailyfat = 0.0;

  var dailycarbohydrate = 0.0;

  var caloriesRate = '';

  var proteinRate = '';

  var fatRate = '';

  var carbohydrateRate = '';

  var healthRate;

  var _gender;

  var _age;

  loadProfileInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String gender = await prefs.get("gender");
    setState(() {
      _gender = gender;
    });
    String age = await prefs.get("age");
    setState(() {
      _age = age;
      dailyData();
    });

  }

  dailyData(){
    setState(() {
      if (_age <= 3){
        dailyprotein = 13.0;
        dailycarbohydrate = 130.0;
        dailycalories = 1000.0;
        dailyfat = 3.0;
      }else if (_age <= 8){
        if(_gender == '女'){
          dailyprotein = 19;
          dailycarbohydrate = 130;
          dailycalories = 1000;
          dailyfat = 3;
        }else{
          dailyprotein = 19;
          dailycarbohydrate = 130;
          dailycalories = 1000;
          dailyfat = 3;
        }
      }else if (_age <= 13){
        if(_gender == '女'){
          dailyprotein = 19;
          dailycarbohydrate = 130;
          dailycalories = 1000;
          dailyfat = 3;
        }else {
          dailyprotein = 19;
          dailycarbohydrate = 130;
          dailycalories = 1000;
          dailyfat = 3;
        }}else if (_age <= 18){
        if(_gender == '女'){
          dailyprotein = 19;
          dailycarbohydrate = 130;
          dailycalories = 1000;
          dailyfat = 3;
        }else{
          dailyprotein = 19;
          dailycarbohydrate = 130;
          dailycalories = 1000;
          dailyfat = 3;
        }
      }
    });
    getRate();
    }

    getRate(){
      var count = 0;
      setState(() {
        proteinRate = '';
        caloriesRate = '';
        fatRate = '';
        carbohydrateRate = '';
        if(dailyprotein < protein){
          proteinRate = ' ↓';
          count += 1;
        }else if(dailyprotein > protein){
          proteinRate = ' ↑';
          count += 1;
        }
        if(dailycalories < calories){
          caloriesRate = ' ↓';
          count += 1;
        }else if(dailycalories > calories){
          caloriesRate = ' ↑';
          count += 1;
        }
        if(dailyfat < fat){
          fatRate = ' ↓';
          count += 1;
        }else if(dailyfat > fat){
          fatRate = ' ↑';
          count += 1;
        }
        if(dailycarbohydrate < carbohydrate){
          carbohydrateRate = ' ↓';
          count += 1;
        }else if(dailycarbohydrate > carbohydrate){
          carbohydrateRate = ' ↑';
          count += 1;
        }
      });
      setState(() {
        if (count >= 3){
          healthRate = 'Bad';
        }else if (count == 2){
          healthRate = 'Average';
        }else{
          healthRate = 'Good';
        }
      });
    }


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
    if (result != null) {
      //print('result: ' + result.toString());
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

        //print(widget.foodRecommendation.food_map[result['name']]['calories']);
        calories += double.parse(
            widget.foodRecommendation.food_map[result['name']]['calories']);
        protein += double.parse(
            widget.foodRecommendation.food_map[result['name']]['protein']);
        fat += double.parse(
            widget.foodRecommendation.food_map[result['name']]['fat']);
        carbohydrate += double.parse(widget
            .foodRecommendation.food_map[result['name']]['carbohydrates']);
      });
      getRate();
    }
  }

  @override
  void initState() {
    super.initState();
    loadProfileInfo();

    Recommendation.loadFoodToday("breakfast").then((list) {
      setState(() {
        for (var item in list) {
          if (item != null) {
            breakfastList.add(item);
            //print(list);
          }
        }
      });
      calculateNutrition(breakfastList);
    });
    Recommendation.loadFoodToday("lunch").then((list) {
      this.lunchList = list;
      calculateNutrition(lunchList);
    });
    Recommendation.loadFoodToday("dinner").then((list) {
      this.dinnerList = list;
      calculateNutrition(dinnerList);
    });
    getRate();
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
      temp += double.parse(
          widget.foodRecommendation.food_map[list[i]['name']]['calories']);
    }
    setState(() {
      calories += temp;
    });
    //print('calories' + calories.toString());
  }

  void calculateProtein(list) {
    var temp = 0.0;
    for (int i = 0; i < list.length; i++) {
      temp += double.parse(
          widget.foodRecommendation.food_map[list[i]['name']]['protein']);
    }
    setState(() {
      protein += temp;
    });
    //print('calories' + calories.toString());
  }

  void calculateFat(list) {
    var temp = 0.0;
    for (int i = 0; i < list.length; i++) {
      temp += double.parse(
          widget.foodRecommendation.food_map[list[i]['name']]['fat']);
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
          widget.foodRecommendation.food_map[list[i]['name']]['carbohydrates']);
    }
    setState(() {
      carbohydrate += temp;
    });
    print('carbohydrate' + temp.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        color: Color.fromRGBO(255, 243, 231, 100),
        child: Column(
          children: <Widget>[
            SizedBox(height: 8.0),
            calories > 0
                ? Text("Total Calories: " + calories.toStringAsFixed(2) + caloriesRate,
                    style: TextStyle(fontSize: 20))
                : Text("Total Calories: 0.0", style: TextStyle(fontSize: 20)),
            SizedBox(height: 8.0),
            protein > 0
                ? Text("Total Protein: " + protein.toStringAsFixed(2) + proteinRate,
                    style: TextStyle(fontSize: 20))
                : Text("Total Protein: 0.0", style: TextStyle(fontSize: 20)),
            SizedBox(height: 8.0),
            fat > 0
                ? Text("Total Fat: " + fat.toStringAsFixed(2) + fatRate,
                    style: TextStyle(fontSize: 20))
                : Text("Total Fat: 0.0", style: TextStyle(fontSize: 20)),
            SizedBox(height: 8.0),
            carbohydrate > 0
                ? Text("Total Carbohydrate: " + carbohydrate.toStringAsFixed(2) + carbohydrateRate,
                    style: TextStyle(fontSize: 20))
                : Text("Total Carbohydrate: 0.0",
                    style: TextStyle(fontSize: 20)),
            SizedBox(height: 8.0),
            calories > 0
                ? Text("Health Rate: " + healthRate,
                  style: TextStyle(fontSize: 20))
                : Text(''),
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
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    _navigateAndDisplaySelection(context, "breakfast");
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
                              child:
                                  Image.network(breakfastList[index]['image']),
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
                                              foodId: breakfastList[index]
                                                  ['name'],
                                              recommendation:
                                                  widget.foodRecommendation,
                                            )),
                                  );
                                }),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    removeFood(index, breakfastList,'breakfast');
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
                    margin: EdgeInsets.only(left: 50, top: 30, bottom: 30),
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
                              child: Image.network(lunchList[index]['image']),
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
                                }),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  removeFood(index, lunchList, 'lunch');
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
                    margin: EdgeInsets.only(left: 50, top: 30, bottom: 30),
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
                              child: Image.network(dinnerList[index]['image']),
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
                                }),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  removeFood(index, dinnerList, 'dinner');
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

  void removeFood(index, list, foodTime) {
    setState(() {
      calories -= double.parse(
          widget.foodRecommendation.food_map[list[index]['name']]['calories']);

      protein -= double.parse(widget
          .foodRecommendation.food_map[list[index]['name']]['protein']);

      fat -= double.parse(widget
          .foodRecommendation.food_map[list[index]['name']]['fat']);

      carbohydrate -= double.parse(widget.foodRecommendation
          .food_map[list[index]['name']]['carbohydrates']);
      list.removeAt(index);
      Recommendation.recordFoodToday(foodTime, list);
    });
    getRate();
  }
}
