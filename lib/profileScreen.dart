import 'package:flutter/material.dart';
import 'package:flutter_app/recommendation.dart';
import 'package:flutter_app/signupScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage(
      {Key key, this.title, this.recommendationAct, this.recommendationFood})
      : super(key: key);
  final String title;
  var recommendationAct;
  Recommendation recommendationFood;
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var rating = 'N/A';
  var healthRating = 'N/A';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var b = context;
    loadProfileInfo();
    widget.recommendationFood.getRating().then((res) {
      print("rating " + res);
      setState(() {
        rating = res;
      });
    });
  }

  var _weight;
  var _head;
  var _height;
  var _gender;
  var _age;
  var _id;

  loadProfileInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String weight = await prefs.get("weight");
    setState(() {
      _weight = weight;
    });
    String height = await prefs.get("height");
    setState(() {
      _height = height;
    });
    String head = await prefs.get("head");
    setState(() {
      _head = head;
    });
    String gender = await prefs.get("gender");
    setState(() {
      _gender = gender;
    });
    String age = await prefs.get("age");
    setState(() {
      _age = age;
    });
    String ID = await prefs.get("ID");
    setState(() {
      _id = ID;
    });
    getHealthRating();
  }

  getHealthRating() {
    if (_gender == 'female') {
      if (int.parse(_head) <= 2 &&
          int.parse(_height) <= 20 &&
          int.parse(_age) <= 2 &&
          int.parse(_weight) <= 30) {
        healthRating = "normal";
      } else {
        healthRating = "bad";
      }
    } else {
      if (_head <= 2 && _height <= 20 && _age <= 2 && _weight <= 30) {
        healthRating = "normal";
      } else {
        healthRating = "bad";
      }
    }
  }

  fontStyle() {
    return TextStyle(fontSize: 15, color: Color.fromRGBO(179, 77, 77, 100));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 243, 231, 100),
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        leading: Container(),
        backgroundColor: Color.fromRGBO(255, 180, 105, 100),
        elevation: 0.0,
      ),
      body: Center(
        child: Container(
          color: Color.fromRGBO(255, 243, 231, 100),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Color.fromRGBO(255, 214, 214, 100),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          alignment: Alignment.centerRight,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://cdn4.iconfinder.com/data/icons/small-n-flat/24/user-alt-512.png"),
                            radius: 40,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "$_id",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.only(left: 75, right: 50),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: Text(
                                  "health rating：$healthRating",
                                  textAlign: TextAlign.right,
                                  style: fontStyle(),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(right: 50),
                              child: Text(
                                "体重：$_weight",
                                textAlign: TextAlign.right,
                                style: fontStyle(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: Text(
                                  "身高：$_height",
                                  textAlign: TextAlign.right,
                                  style: fontStyle(),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(left: 30, top: 50),
                              child: Text(
                                "头围：$_head",
                                textAlign: TextAlign.left,
                                style: fontStyle(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: Text(
                                  "性别：$_gender",
                                  textAlign: TextAlign.right,
                                  style: fontStyle(),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin:
                                  EdgeInsets.only(left: 30, top: 50, right: 30),
                              child: Text(
                                "年龄：$_age",
                                textAlign: TextAlign.left,
                                style: fontStyle(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(top: 50, bottom: 50),
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => SignUpPage(
                                              title: 'Edit Information',
                                              recommendationActivity:
                                                  widget.recommendationAct,
                                              foodRecommendation:
                                                  widget.recommendationFood,
                                            )),
                                  );
                                },
                                child: Text(
                                  "Edit",
                                  style: fontStyle(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
