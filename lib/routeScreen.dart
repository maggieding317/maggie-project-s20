import 'package:flutter/material.dart';
import 'package:flutter_app/activityScreen.dart';
import 'package:flutter_app/scheduleScreen.dart';
import 'package:flutter_app/foodScreen.dart';
import 'package:flutter_app/profileScreen.dart';
import 'package:flutter_app/recommendation_activity.dart';
import 'recommendation.dart';
import 'foodRecommendationScreen.dart';
import 'yourFoodScreen.dart';

class RoutePage extends StatefulWidget {
  RoutePage(
      {Key key,
      this.title,
      this.recommendationActivity,
      this.foodRecommendation})
      : super(key: key);

  final String title;
  RecommendationActivity recommendationActivity;
  Recommendation foodRecommendation;

  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions;
  static List<String> choices = ['推荐菜单', '记录菜单'];

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      FoodRecommendationPage(
        title: '推荐菜单',
        recommendation: widget.foodRecommendation,
      ),
      RecommendedActivityPage(
        title: "活动",
        recommendation: widget.recommendationActivity,
      ),
      SchedulePage(
        title: "日程表",
        recommendationActivity: widget.recommendationActivity,
      ),
      ProfilePage(
        title: "个人",
        recommendationAct: widget.recommendationActivity,
        recommendationFood: widget.foodRecommendation,
      ),
      yourFoodPage(
        title: '记录菜单',
        foodRecommendation: widget.foodRecommendation,
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

   getBottomNavigatorBar(){
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color.fromRGBO(255, 180, 105, 100),
      elevation: 0.0,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('饮食'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          title: Text('活动'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          title: Text('日程表'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          title: Text('个人'),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _selectedIndex == 0
        ? DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Color.fromRGBO(255, 180, 105, 100),
                elevation: 0.0,
                bottom: TabBar(
                  tabs: [
                    Tab(
                        child: Text(
                      '推荐菜单',
                      style: TextStyle(fontSize: 20),
                    )),
                    Tab(
                        child: Text(
                      '记录菜单',
                      style: TextStyle(fontSize: 20),
                    )),
                  ],
                ),
                leading: Container(),
              ),
              body: TabBarView(
                children: [
                  _widgetOptions.elementAt(_selectedIndex),
                  _widgetOptions.elementAt(4),
                ],
              ),
              bottomNavigationBar: getBottomNavigatorBar()
            ))
        : Scaffold(
            body: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
            bottomNavigationBar: getBottomNavigatorBar()
          );
  }
}
