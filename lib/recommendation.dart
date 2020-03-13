import 'package:shared_preferences/shared_preferences.dart';

class Recommendataion {
  var food_map = {
    "egg" : {
      "id" : "egg",
      "name" : "Bread",
      "image" : "https://lh3.googleusercontent.com/proxy/wtqY1ThjGPtYU6fzx_pJ0rPyGF-svFNEyhegBA0f3mrjeFst_yxW8Idct3Ocpk29HeqT5rLdmcNR_GaIPWL1j1yt2_kfLgM8v4uz_7bMAm9i7DKg4YANdNwTzEcecSrc86m88kL1bOyD48GR-_2uYFJlnVZ6Qm4",
    },
    "pork" : {
      "id" : "pork",
      "name" : "Pork",
      "image" : "https://lh3.googleusercontent.com/proxy/wtqY1ThjGPtYU6fzx_pJ0rPyGF-svFNEyhegBA0f3mrjeFst_yxW8Idct3Ocpk29HeqT5rLdmcNR_GaIPWL1j1yt2_kfLgM8v4uz_7bMAm9i7DKg4YANdNwTzEcecSrc86m88kL1bOyD48GR-_2uYFJlnVZ6Qm4",
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