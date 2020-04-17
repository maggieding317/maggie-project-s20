import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Recommendataion {

  // food_map['foodid']['name']  food_map['foodid']['image']
  static Map<String, dynamic> food_map = {
    "egg" : {
      "id" : "egg",
      "name" : "Egg",
      "value" : "10",
      "image" : "https://icons-for-free.com/iconfiles/png/512/egg+egg+yolk+eggs+hard+boiled+egg+yolk+icon-1320168013373808361.png",
    },
    "bread":{
      "id":"bread",
      "name" : "Bread",
      "value" : "5",
      "image" : "https://cdn2.iconfinder.com/data/icons/mini-icon-set-food/91/Food_16-512.png",
    },
    "milk":{
      "id":"milk",
      "name" : "milk",
      "value" : "12",
      "image" : "https://cdn.iconscout.com/icon/premium/png-256-thumb/milk-1637594-1387047.png",
    },
    "bacon":{
      "id":"bacon",
      "name" : "bacon",
      "value" : "14",
      "image" : "https://cdn.iconscout.com/icon/premium/png-256-thumb/bacon-23-565349.png",
    },
    "sausage":{
      "id":"sausage",
      "name" : "sausage",
      "value" : "3",
      "image" : "https://cdn.iconscout.com/icon/premium/png-256-thumb/sausage-176-1051414.png",
    },
    "pork":{
      "id":"pork",
      "name" : "pork",
      "value" : "14",
      "image" : "https://extension.umd.edu/sites/default/files/_images/programs/agmarketing/Pork.png",
    },
    "chicken":{
      "id":"chicken",
      "name" : "chicken",
      "value" : "16",
      "image" : "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRfM5V0hpPJGa9GVkIBVJX2m-dDP0qY-EhcJdyZo9weoWkjm-qE",
    },
    "beef":{
      "id":"beef",
      "name":"beef",
      "value" : "11",
      "image":"https://cdn3.iconfinder.com/data/icons/restaurant-2-1/2134/roast_beef_steak_grilled_meat_food-512.png",
    },
    "shrimp":{
      "id":"shrimp",
      "name":"shrimp",
      "value" : "9",
      "image":"https://image.flaticon.com/icons/png/512/123/123287.png",
    },
    "lettuce":{
      "id":"lettuce",
      "name":"lettuce",
      "value" : "12",
      "image":"https://img.icons8.com/cotton/2x/lettuce-1--v2.png",
    },

  };

  var recommendation_options = {
    "normal" : {
      "breakfast" : [
        "egg",
        "milk",
      ],
      "lunch" : [
        "milk",
        "chicken",
        "egg",
      ],
      "dinner" : [
        "milk",
        "sausage",
        "bacon",
      ],
    },

    "lack_vit_d" : {
      "breakfast" : [
        "sausage",
        "egg",
        "milk",
      ],
      "lunch" : [
        "pork",
        "chicken",
        "milk",
      ],
      "dinner" : [
        "sausage",
        "milk",
        "bacon",
      ],
    },

    "overweight" : {
      "breakfast" : [
        "milk",
        "egg",
      ],
      "lunch" : [
        "milk",
        "sausage",
      ],
      "dinner" : [
        "pork",
        "egg",
        "milk",
      ],
    },

    "short" : {
      "breakfast" : [
        "milk",
        "egg",
        "pork",
      ],
      "lunch" : [
        "milk",
        "sausage",
        "pork"
      ],
      "dinner" : [
        "pork",
        "chicken",
        "milk",
      ],
    },
  };

  static List<Map<String, String>> getFoodList() {
    var foodList = List<Map<String, String>>();
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

  static Future<String> getRating() async {
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