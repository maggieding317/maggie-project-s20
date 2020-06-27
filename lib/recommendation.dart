import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Recommendation {

  // food_map['foodid']['name']  food_map['foodid']['image']
  Map<String, dynamic> food_map = {};

  var recommendation_options = {};

  Recommendation(){
    http.get('https://marisabelc.github.io/baby_food/recommendation_food.json').then((res) {
      print('======get food ======');
      var resObj = jsonDecode(res.body);
      food_map =resObj['food'];
      recommendation_options= resObj['options'];
    }).catchError((e){
      print('failed to get response');
    });
  }

  List<Map<String, dynamic>> getFoodList() {
    List<Map<String, dynamic>> foodList=[];
    food_map.forEach((k, v) {
      foodList.add(v);
    });
    print(foodList);
    return foodList;
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

  Future<Map> get_recommended_food() async {
    await _loadProfileInfo();
    if (weight < 30 && age > 1) {
      return Future.value(recommendation_options['lack_vit_d']);
    } else if (weight > 35 && height < 24 && age > 2) {
      return Future.value(recommendation_options['normal']);
    }
      else if (weight > 35 && height < 24 && age < 2) {
      return Future.value(recommendation_options['overweight']);
    }  else if (weight < 35 && height < 20 && age > 1) {
      return Future.value(recommendation_options['short']);
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

  Future<String> getRating() async {
    var score = 0;
    List<dynamic> breakfast = await loadFoodToday('breakfast');
    for(var f in breakfast) {
      score += int.parse(f['value']);
    }
    List<dynamic> lunch = await loadFoodToday('lunch');
    for(var f in lunch) {
      score += int.parse(f['value']);
    }
    List<dynamic> dinner = await loadFoodToday('dinner');
    for(var f in dinner) {
      score += int.parse(f['value']);
    }

    if (score > 100) {
      return 'Excellent';
    } else if (score > 75) {
      return 'Good';
    } else if (score > 50) {
      return 'OK';
    } else if (score > 25) {
      return 'poor';
    } else {
      return 'warning';
    }
  }
}