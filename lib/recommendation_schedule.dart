import 'package:flutter/foundation.dart';
import 'package:flutter_app/recommendation.dart';
import 'package:flutter_app/recommendation_activity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class RecommendataionSchedule {

  Recommendataion foodRec = Recommendataion();
  RecommendataionActivity activityRec = RecommendataionActivity();

  Future<List<dynamic>> get_recommended_schedul() async {
    var rec_activity = await activityRec.get_recommended_activities();
    var schedule_list = [];
    schedule_list.add({
      "time" : "8:00am",
      "type" : "food",
      "name" : "Breakfast"
    });
    schedule_list.add({
      "time" : "9:00am",
      "type" : "activity",
      "name" : rec_activity[0]
    });
    schedule_list.add({
      "time" : "10:00am",
      "type" : "activity",
      "name" : rec_activity[1]
    });
    schedule_list.add({
      "time" : "12:00am",
      "type" : "food",
      "name" : "Lunch"
    });
    schedule_list.add({
      "time" : "12:30pm",
      "type" : "activity",
      "name" : "nap"
    });
    schedule_list.add({
      "time" : "2:00pm",
      "type" : "activity",
      "name" : rec_activity[1]
    });
    schedule_list.add({
      "time" : "9:00pm",
      "type" : "activity",
      "name" : "sleep"
    });
    return schedule_list;
  }

  void demo() {
    RecommendataionSchedule recSchedule = RecommendataionSchedule();
    recSchedule.get_recommended_schedul().then((schedule) {
      print("recommended schedule is: " + schedule.toString());
    });
  }

}