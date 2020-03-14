import 'package:shared_preferences/shared_preferences.dart';

class Recommendataion {
  var food_map = {
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
        "bread",
        "egg",
      ],
      "lunch" : [
        "rice",
        "pork",
        "egg",
      ],
      "dinner" : [
        "banana",
        "beef",
        "lettuce",
      ],
    },

    "lack_vit_d" : {
      "breakfast" : [
        "bread",
        "egg",
        "egg",
      ],
      "lunch" : [
        "rice",
        "pork",
        "egg",
      ],
      "dinner" : [
        "banana",
        "beef",
        "egg",
      ],
    }
  };

  var id;
  var weight;
  var height;
  var head;
  var gender;
  var age;

  void _loadProfileInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString("ID");
    weight = prefs.getString("weight");
    height = prefs.getString("height");
    head = prefs.getString("head");
    gender = prefs.getString("gender");
    age = prefs.getString("age");
  }

  Map get_recommended_food() {
    _loadProfileInfo();
  }
}