import 'package:shared_preferences/shared_preferences.dart';

class Recommendataion {

  static Map<String, dynamic> food_map = {
    "egg" : {
      "id" : "egg",
      "name" : "egg",
      "image" : "https://lh3.googleusercontent.com/proxy/wtqY1ThjGPtYU6fzx_pJ0rPyGF-svFNEyhegBA0f3mrjeFst_yxW8Idct3Ocpk29HeqT5rLdmcNR_GaIPWL1j1yt2_kfLgM8v4uz_7bMAm9i7DKg4YANdNwTzEcecSrc86m88kL1bOyD48GR-_2uYFJlnVZ6Qm4",
    },
    "bread":{
      "id":"bread",
      "name" : "Bread",
      "image" : "https://lh3.googleusercontent.com/proxy/wtqY1ThjGPtYU6fzx_pJ0rPyGF-svFNEyhegBA0f3mrjeFst_yxW8Idct3Ocpk29HeqT5rLdmcNR_GaIPWL1j1yt2_kfLgM8v4uz_7bMAm9i7DKg4YANdNwTzEcecSrc86m88kL1bOyD48GR-_2uYFJlnVZ6Qm4",
    },
    "milk":{
      "id":"milk",
      "name" : "milk",
      "image" : "https://cdn.iconscout.com/icon/premium/png-256-thumb/milk-1637594-1387047.png",
    },
    "bacon":{
      "id":"bacon",
      "name" : "bacon",
      "image" : "https://cdn.iconscout.com/icon/premium/png-256-thumb/bacon-23-565349.png",
    },
    "sausage":{
      "id":"sausage",
      "name" : "sausage",
      "image" : "https://cdn.iconscout.com/icon/premium/png-256-thumb/sausage-176-1051414.png",
    },
    "pork":{
      "id":"sausage",
      "name" : "sausage",
      "image" : "https://cdn.iconscout.com/icon/premium/png-256-thumb/sausage-176-1051414.png",
    },
    "chicken":{
      "id":"chicken",
      "name" : "chicken",
      "image" : "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRfM5V0hpPJGa9GVkIBVJX2m-dDP0qY-EhcJdyZo9weoWkjm-qE",
    }

  };

  var recommendation_options = {
    "normal" : {
      "breakfast" : [
        "egg",
        "egg",
      ],
      "lunch" : [
        "pork",
        "pork",
        "egg",
      ],
      "dinner" : [
        "pork",
        "pork",
        "pork",
      ],
    },

    "lack_vit_d" : {
      "breakfast" : [
        "pork",
        "egg",
        "egg",
      ],
      "lunch" : [
        "pork",
        "pork",
        "pork",
      ],
      "dinner" : [
        "pork",
        "pork",
        "pork",
      ],
    }
  };

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
    } else {
      return Future.value(recommendation_options['normal']);
    }
  }
}