import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class RecommendataionActivity {

  static Map<String, dynamic> acitivity_map = {
    "soccer" : {
      "id" : "soccer",
      "name" : "Soccer",
      "description" : "Fun sports",
      "image" : "https://icons-for-free.com/iconfiles/png/512/egg+egg+yolk+eggs+hard+boiled+egg+yolk+icon-1320168013373808361.png",
    },
    "basketball":{
      "id":"basketball",
      "name" : "Basketball",
      "description" : "Fun sports 2",
      "image" : "https://cdn2.iconfinder.com/data/icons/mini-icon-set-food/91/Food_16-512.png",
    },
    "painting":{
      "id":"painting",
      "name" : "Painting",
      "description" : "Fun sports 3",
      "image" : "https://cdn.iconscout.com/icon/premium/png-256-thumb/milk-1637594-1387047.png",
    },
    "sleep":{
      "id":"sleep",
      "name":"Sleep",
      "descrition":"Activity 4",
      "image":"https://www.nicepng.com/png/detail/185-1858087_sleeping-icon-pencil-and-sleeping-in-bed-icon.png",
    },
    "music":{
      "id":"music",
      "name":"music",
      "description":"activity 5",
      "image":"https://cdn4.iconfinder.com/data/icons/jumpicon-entertainment-glyph-1/32/-_Listen-Music-Headphone-Listening-Audio-Headset-512.png",
    },
    "story":{
      "id":"story",
      "name":"story",
      "description":"activity 6",
      "image":"https://cdn1.iconfinder.com/data/icons/children-autism-spectrum-disorder-asd/299/autism-child-children-008-512.png",
    },
  };

  var recommendation_options = {
    "normal" : [
      "soccer",
      "painting"
    ],

    "lack_vit_d" : [
      "basketball",
      "painting"
    ],

    "overweight" : [
      "basketball",
      "soccer",
    ],
  };

  static List<Map<String, String>> getItemList() {
    var itemList = List<Map<String, String>>();
    acitivity_map.forEach((k, v) {
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