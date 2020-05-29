import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;



class Recomendation {
  var recommendation_options={};
  Map<String, dynamic> activity_map = {};

  Recomendation({this.recommendation_options, this.activity_map});

  factory Recomendation.fromJson(Map<String, dynamic> parsedJson) {
    return Recomendation(
        activity_map: parsedJson['activity'],
        recommendation_options: parsedJson['option'],
    );
  }
}


class RecommendataionActivity {



  Future<String> _loadRecomendationAsset() async {
  return await rootBundle.loadString('assets/recomendation_activity.json');
  }

  Future<Recomendation> loadRecomendation() async {
  await wait(2);
  String jsonString = await _loadRecomendationAsset();
  final jsonResponse = json.decode(jsonString);
  return new Recomendation.fromJson(jsonResponse);
  }

  Future wait(int seconds) {
  return new Future.delayed(Duration(seconds: seconds), () => {});
  }


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
    await _loadProfileInfo();
    if (weight < 30 && age > 1) {
      return Future.value(recommendation_options['normal']);
    } else if (weight > 35 && height < 24 && age > 2) {
      return Future.value(recommendation_options['normal']);
    }
      else if (weight > 35 && height < 24 && age < 2) {
      return Future.value(recommendation_options['normal']);
    }  else if (weight < 35 && height < 20 && age > 1) {
      return Future.value(recommendation_options['normal']);
    }else {
      return Future.value(recommendation_options['normal']);
    }
  }

  static void recordFoodToday(food_type, foodList) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString(food_type + "_today", jsonEncode(foodList));
    });
  }

  static Future<List<dynamic>> loadFoodToday (food_type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var foodListStr = prefs.getString(food_type + "_today");
    if (foodListStr == null) {
      return Future.value(List<dynamic>());
    }
    return Future.value(jsonDecode(foodListStr));
  }
}