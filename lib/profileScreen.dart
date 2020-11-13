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
//    widget.recommendationFood.getRating().then((res) {
//      print("rating " + res);
//      setState(() {
//        rating = res;
//      });
//    });
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
    if (_gender == 'Female') {
      if (double.parse(_head) <= 2 &&
          double.parse(_height) <= 20 &&
          double.parse(_age) <= 2 &&
          double.parse(_weight) <= 30) {
        healthRating = 'hum';
      }
      if (_height <= 106) {
        if (_weight < 14) {
          healthRating = 'UnderWeight';
        } else if (_weight > 17) {
          healthRating = 'OverWeight';
        } else {
          healthRating = 'Normal';
        }
      }
      else if (_height <= 108) {
        if (_weight < 14.4) {
          healthRating = 'UnderWeight';
        } else if (_weight > 17.6) {
          healthRating = 'OverWeight';
        } else {
          healthRating = 'Normal';
        }
      }
      else if (_height <= 112) {
        if (_weight < 16) {
          healthRating = 'UnderWeight';
        } else if (_weight > 19.2) {
          healthRating = 'OverWeight';
        } else {
          healthRating = 'Normal';
        }
      }
      else if (_height <= 116) {
        if (_weight < 17.4) {
          healthRating = 'UnderWeight';
        } else if (_weight > 21.1) {
          healthRating = 'OverWeight';
        } else {
          healthRating = 'Normal';
        }
      }
      else if (_height <= 120) {
        if (_weight < 19) {
          healthRating = 'UnderWeight';
        } else if (_weight > 23.1) {
          healthRating = 'OverWeight';
        } else {
          healthRating = 'Normal';
        }
      }
      else if (_height <= 124) {
        if (_weight < 20.9) {
          healthRating = 'UnderWeight';
        } else if (_weight > 25.4) {
          healthRating = 'OverWeight';
        } else {
          healthRating = 'Normal';
        }
      }
      else if (_height <= 128) {
        if (_weight < 23) {
          healthRating = 'UnderWeight';
        } else if (_weight > 28) {
          healthRating = 'OverWeight';
        } else {
          healthRating = 'Normal';
        }
      }
      else if (_height <= 132) {
        if (_weight < 25) {
          healthRating = 'UnderWeight';
        } else if (_weight > 30.6) {
          healthRating = 'OverWeight';
        } else {
          healthRating = 'Normal';
        }
      }
      else if (_height <= 136) {
        if (_weight < 30) {
          healthRating = 'UnderWeight';
        } else if (_weight > 35.7) {
          healthRating = 'OverWeight';
        } else {
          healthRating = 'Normal';
        }
      }
      else if (_height <= 142) {
        if (_weight < 32) {
          healthRating = 'UnderWeight';
        } else if (_weight > 39.1) {
          healthRating = 'OverWeight';
        } else {
          healthRating = 'Normal';
        }
      }
      else if (_height <= 146) {
        if (_weight < 35.2) {
          healthRating = 'UnderWeight';
        } else if (_weight > 42.9) {
          healthRating = 'OverWeight';
        } else {
          healthRating = 'Normal';
        }
      }
      else if (_height <= 150) {
        if (_weight < 38.4) {
          healthRating = 'UnderWeight';
        } else if (_weight > 46.8) {
          healthRating = 'OverWeight';
        } else {
          healthRating = 'Normal';
        }
      }
      else if (_height <= 154) {
        if (_weight < 41) {
          healthRating = 'UnderWeight';
        } else if (_weight > 50.5) {
          healthRating = 'OverWeight';
        } else {
          healthRating = 'Normal';
        }
      }
      else if (_height <= 158) {
        if (_weight < 44.1) {
          healthRating = 'UnderWeight';
        } else if (_weight > 54.1) {
          healthRating = 'OverWeight';
        } else {
          healthRating = 'Normal';
        }
      }
      else if (_height <= 162) {
        if (_weight < 47.2) {
          healthRating = 'UnderWeight';
        } else if (_weight > 57.5) {
          healthRating = 'OverWeight';
        } else {
          healthRating = 'Normal';
        }
      }
      else if (_height <= 166) {
        if (_weight < 49.5) {
          healthRating = 'UnderWeight';
        } else if (_weight > 60.6) {
          healthRating = 'OverWeight';
        } else {
          healthRating = 'Normal';
        }
      }
      else if (_height <= 170) {
        if (_weight < 52) {
          healthRating = 'UnderWeight';
        } else if (_weight > 63.5) {
          healthRating = 'OverWeight';
        } else {
          healthRating = 'Normal';
        }
      }
      else if (_height <= 174) {
        if (_weight < 54) {
          healthRating = 'UnderWeight';
        } else if (_weight > 66) {
          healthRating = 'OverWeight';
        } else {
          healthRating = 'Normal';
        }
      }
      else if (_height <= 178) {
        if (_weight < 55.9) {
          healthRating = 'UnderWeight';
        } else if (_weight > 68.4) {
          healthRating = 'OverWeight';
        } else {
          healthRating = 'Normal';
        }
      }
      else if (_height <= 180) {
        if (_weight < 56.2) {
          healthRating = 'UnderWeight';
        } else if (_weight > 69.4) {
          healthRating = 'OverWeight';
        } else {
          healthRating = 'Normal';
        }
      }

    }  else {
      if (_head <= 2 && _height <= 20 && _age <= 2 && _weight <= 30) {
        healthRating = "normal";
      } else {
        healthRating = "bad";
      }
    }
  }

  fontStyle() {
    return TextStyle(fontSize: 16);
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
                            style: TextStyle(fontSize: 30),
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
                  margin: EdgeInsets.only(left: 60, right: 50, top: 20),
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
                                  "性别: $_gender",
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
                              margin: EdgeInsets.all(50),
                              child: RaisedButton(
                                color:Color.fromRGBO(255, 243, 231, 100),
                                elevation: 0.0,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => SignUpPage(
                                              title: '编辑信息',
                                              recommendationActivity:
                                                  widget.recommendationAct,
                                              foodRecommendation:
                                                  widget.recommendationFood,
                                            )),
                                  );
                                },
                                child: Text(
                                  "编辑信息",
                                  style: fontStyle(),
                                ),

                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.black, width: 2)),
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
