import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async' show Future;
//import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;

//class Recommendation {
//  var recommendation_options = {};
//  Map<String, dynamic> activity_map = {};
//
//  Recommendation({this.recommendation_options, this.activity_map});
//
//  factory Recommendation.fromJson(Map<String, dynamic> parsedJson) {
//    return Recommendation(
//      activity_map: parsedJson['activity'],
//      recommendation_options: parsedJson['option'],
//    );
//  }
//}

class RecommendationActivity {
  static var activity_map;
  var recommendation_options;

  RecommendationActivity(){
    http.get('https://marisabelc.github.io/baby_food/recommendation_activity.json').then((res) {
//      print('======get======');
      var resObj = jsonDecode(res.body);
      activity_map =resObj['activity'];
      recommendation_options= resObj['option'];
    }).catchError((e){
      print('failed to get response');
    });
  }

//  init() {
//    loadRecomendation().then((recommendation) {
//      activity_map = recommendation.activity_map;
//      recommendation_options = recommendation.recommendation_options;
//    });
//  }
//
//  Future<String> _loadRecomendationAsset() async {
//    return await rootBundle.loadString('assets/recommendation_activity.json');
//  }
//
//  Future<Recommendation> loadRecomendation() async {
////    await wait(2);
//
//    String jsonString = await _loadRecomendationAsset();
//    final jsonResponse = json.decode(jsonString);
//    return new Recommendation.fromJson(jsonResponse);
//  }

//  Future wait(int seconds) {
//    return new Future.delayed(Duration(seconds: seconds), () => {});
//  }

  static List<Map<String, String>> getItemList() {
    var itemList = List<Map<String, String>>();
    activity_map.forEach((k, v) {
      itemList.add(v);
    });
    print(itemList);
    return itemList;
  }

  var id;
  var weight;
  var height;
  var head;
  var gender;
  var age;

  Future<void> _loadProfileInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString("ID");
    print(id);
    weight = double.parse(prefs.getString("weight"));
    print(weight);
    height = double.parse(prefs.getString("height"));
    print(height);
    head = double.parse(prefs.getString("head"));
    print(head);
    gender = prefs.getString("gender");
    print(gender);
    age = int.parse(prefs.getString("age"));
    print(age);
  }

  Future<List> get_recommended_activities() async {
    print('reco');
    await _loadProfileInfo();
    print(gender);
    if (weight < 30 && age > 1) {
      return Future.value(recommendation_options[gender]['normal']);
    } else if (weight > 35 && height < 24 && age > 2) {
      return Future.value(recommendation_options[gender]['normal']);
    } else if (weight > 35 && height < 24 && age < 2) {
      return Future.value(recommendation_options[gender]['normal']);
    } else if (weight < 35 && height < 20 && age > 1) {
      return Future.value(recommendation_options[gender]['normal']);
    } else {
      print(recommendation_options[gender]['normal']);
      return Future.value(recommendation_options[gender]['normal']);
    }
  }

  static void recordFoodToday(food_type, foodList) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString(food_type + "_today", jsonEncode(foodList));
    });
  }

  static Future<List<dynamic>> loadFoodToday(food_type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var foodListStr = prefs.getString(food_type + "_today");
    if (foodListStr == null) {
      return Future.value(List<dynamic>());
    }
    return Future.value(jsonDecode(foodListStr));
  }
}
