import 'package:flutter/material.dart';
import 'package:flutter_app/recommendation.dart';

class FoodList extends StatefulWidget {
  FoodList({Key key, this.title, this.foodRecommendation}) : super(key: key);

  Recommendation foodRecommendation;
  final String title;

  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  @override
  void initState() {
    super.initState();
    foodList = widget.foodRecommendation.getFoodList();
    setState(() {
      for (var food in foodList) {
        food['counter'] = 0;
      }
    });

//    print(foodList);
  }

  var foodList = [];
  var foodAdded = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text(widget.title),
        leading: Container(),
        backgroundColor: Color.fromRGBO(255, 180, 105, 100),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(left: 50, top: 30, bottom: 30),
                    child: Container(

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(

                            icon: Icon(
                              Icons.done,
                              color: Colors.green,
                            ),
                            onPressed: () {
                              Navigator.pop(context, foodAdded);
                            },
                          ),
                          Text('Done')
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: foodList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: () {
                        //print("clicked!");
                      },
                      title: Container(
                        height: 50,
                        child: Center(
                          child: Row(children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 80,
                                width: 80,
                                child: Image.network(foodList[index]['image']),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
//                                     margin: EdgeInsets.only(right: 30),
                                child: Text(
                                  foodList[index]['name'],
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 80,
                                width: 80,
                                child: IconButton(
                                  icon: Icon(Icons.add_circle_outline),
                                  onPressed: () {
                                    updateCounter(index, 1);
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Text(
                                  foodList[index]['counter'].toString(),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 80,
                                width: 80,
                                child: IconButton(
                                  icon: Icon(Icons.remove_circle_outline),
                                  onPressed: () {
                                    updateCounter(index, -1);
                                  },
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void updateCounter(int index, int value) {
    print(foodList);
    if (value < 0 && foodList[index]['counter'] == 0) return;
    setState(() {
      foodList[index]['counter'] += value;
      if (value > 0)
        foodAdded.add(foodList[index]);
      else
        foodAdded.remove(foodList[index]);
    });
  }
}
