import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'foodList.dart';
import 'foodRecommendationScreen.dart';
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

  _navigateAndDisplaySelection(BuildContext context, String meal) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.

    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(
          builder: (context) => FoodList(
                title: "Food List",foodRecommendation: widget.foodRecommendation,
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
    });
  }

  @override
  void initState() {
    super.initState();
    Recommendation.loadFoodToday("breakfast").then((list) {
      setState(() {
        for (var item in list){
          if (item != null){
            breakfastList.add(item);
            print(list);
          }
        }
      });
    });
    Recommendation.loadFoodToday("lunch").then((list) {
      this.lunchList = list;

    });
    Recommendation.loadFoodToday("dinner").then((list) {
      this.dinnerList = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//       appBar: AppBar(
//        title: Text(widget.title),
//        backgroundColor: Color.fromRGBO(255, 180, 105, 100),
//        elevation: 0.0,
//      ),
      body: Center(
        child: Column(
            children: <Widget>[
            Expanded(
            flex: 2,
            child: Container(
                child: Row(children: <Widget>[
                  Expanded(
                      flex: 5,
                      child: Container(
                        child: FlatButton(
                            child: Text('记录菜单 '),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => yourFoodPage(title: '记录菜单',foodRecommendation: widget.foodRecommendation,)),
                              );
//                        swapColor(true);
                            }),
//                  color: _allColor,
                      )),
                  Expanded(
                      flex: 5,
                      child: Container(
                        child:
                        FlatButton(child: Text('推荐菜单'), onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FoodRecommendationPage(title: '推荐菜单',recommendation: widget.foodRecommendation,)),
                          );
                        }),
                      ))
                ]))),
        Expanded(
          flex:9,
          child: Container(
            color: Color.fromRGBO(255, 243, 231, 100),
            child: Column(
              children: <Widget>[
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
                                child: Container(
                                  margin: EdgeInsets.only(right: 30),
                                  child: Text(
                                    breakfastList[index]['name'],
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      setState(() {
                                        breakfastList.removeAt(index);
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
                                child: Container(
                                  margin: EdgeInsets.only(right: 30),
                                  child: Text(
                                    lunchList[index]['name'],
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      setState(() {
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
                                child: Container(
                                  margin: EdgeInsets.only(right: 30),
                                  child: Text(
                                    dinnerList[index]['name'],
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      setState(() {
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
        ),
    ],
      ),
      ),
    );
  }
}
