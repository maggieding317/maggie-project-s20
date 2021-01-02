import 'package:flutter/foundation.dart';
import 'package:flutter_app/recommendation.dart';
import 'package:flutter_app/recommendation_activity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class RecommendataionSchedule {


  Recommendation foodRec = Recommendation();
  RecommendationActivity activityRec;
  RecommendataionSchedule(this.activityRec){}

  Future<List<dynamic>> get_recommended_schedul() async {
    var rec_activity = await activityRec.get_recommended_activities();
    var schedule_list = [];
    schedule_list.add({
      "time" : "8:00am",
      "type" : "food",
      "name" : rec_activity[0]
    });
    schedule_list.add({
      "time" : "9:00am",
      "type" : "activity",
      "name" : rec_activity[4]
    });
    schedule_list.add({
      "time" : "10:00am",
      "type" : "activity",
      "name" : rec_activity[5]
    });
    schedule_list.add({
      "time" : "12:00am",
      "type" : "food",
      "name" : rec_activity[1]
    });
    schedule_list.add({
      "time" : "12:30pm",
      "type" : "activity",
      "name" : rec_activity[3]
    });
    schedule_list.add({
      "time" : "2:00pm",
      "type" : "activity",
      "name" : rec_activity[6]
    });
    schedule_list.add({
      "time" : "5:00pm",
      "type" : "food",
      "name" : rec_activity[2]
    });
    schedule_list.add({
      "time" : "9:00pm",
      "type" : "activity",
      "name" : rec_activity[3]
    });
    return schedule_list;
  }

  void demo() {
    RecommendationActivity recommendationActivity = RecommendationActivity();
    RecommendataionSchedule recSchedule = RecommendataionSchedule(recommendationActivity);
    recSchedule.get_recommended_schedul().then((schedule) {
      //print("recommended schedule is: " + schedule.toString());
    });
  }

}