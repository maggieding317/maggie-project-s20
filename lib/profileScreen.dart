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
    var height = double.parse(_height);
    var weight = double.parse(_weight);
    if (_gender == '女') {
      if (double.parse(_head) <= 2 &&
          double.parse(_height) <= 20 &&
          double.parse(_age) <= 2 &&
          double.parse(_weight) <= 30) {
        healthRating = 'hum';
      }
      if (height <= 106) {
        if (weight < 14) {
          healthRating = '偏轻';
        } else if (weight > 17) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }
      else if (height <= 108) {
        if (weight < 14.4) {
          healthRating = '偏轻';
        } else if (weight > 17.6) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }
      else if (height <= 112) {
        if (weight < 16) {
          healthRating = '偏轻';
        } else if (weight > 19.2) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }
      else if (height <= 116) {
        if (weight < 17.4) {
          healthRating = '偏轻';
        } else if (weight > 21.1) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }
      else if (height <= 120) {
        if (weight < 19) {
          healthRating = '偏轻';
        } else if (weight > 23.1) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }
      else if (height <= 124) {
        if (weight < 20.9) {
          healthRating = '偏轻';
        } else if (weight > 25.4) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }
      else if (height <= 128) {
        if (weight < 23) {
          healthRating = '偏轻';
        } else if (_weight > 28) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }
      else if (height <= 132) {
        if (weight < 25) {
          healthRating = '偏轻';
        } else if (_weight > 30.6) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }
      else if (height <= 136) {
        if (weight < 30) {
          healthRating = '偏轻';
        } else if (weight > 35.7) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }
      else if (height <= 142) {
        if (weight < 32) {
          healthRating = '偏轻';
        } else if (weight > 39.1) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }
      else if (height <= 146) {
        if (weight < 35.2) {
          healthRating = '偏轻';
        } else if (weight > 42.9) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }
      else if (height <= 150) {
        if (weight < 38.4) {
          healthRating = '偏轻';
        } else if (_weight > 46.8) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }
      else if (height <= 154) {
        if (weight < 41) {
          healthRating = '偏轻';
        } else if (weight > 50.5) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }
      else if (height <= 158) {
        if (weight < 44.1) {
          healthRating = '偏轻';
        } else if (weight > 54.1) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }
      else if (height <= 162) {
        if (weight < 47.2) {
          healthRating = '偏轻';
        } else if (weight > 57.5) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }
      else if (height <= 166) {
        if (weight < 49.5) {
          healthRating = '偏轻';
        } else if (weight > 60.6) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }
      else if (height <= 170) {
        if (weight < 52) {
          healthRating = '偏轻';
        } else if (weight > 63.5) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }
      else if (height <= 174) {
        if (weight < 54) {
          healthRating = '偏轻';
        } else if (weight > 66) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }
      else if (height <= 178) {
        if (weight < 55.9) {
          healthRating = '偏轻';
        } else if (weight > 68.4) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }
      else if (height <= 180) {
        if (weight < 56.2) {
          healthRating = '偏轻';
        } else if (weight > 69.4) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }

    }  else {
      if (height <= 110) {
        if (weight < 15.9) {
          healthRating = '偏轻';
        } else if (weight > 18) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }else if (height <= 114) {
        if (weight < 17.4) {
          healthRating = '偏轻';
        } else if (weight > 20.4) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }else if (height <= 118) {
        if (weight < 19.1) {
          healthRating = '偏轻';
        } else if (weight > 22.7) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }else if (height <= 122) {
        if (weight < 20.0) {
          healthRating = '偏轻';
        } else if (weight > 23.6) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }else if (height <= 126) {
        if (weight < 22.9) {
          healthRating = '偏轻';
        } else if (weight > 27.6) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }else if (height <= 130) {
        if (weight < 25.4) {
          healthRating = '偏轻';
        } else if (weight > 30.3) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }else if (height <= 134) {
        if (weight < 27.7) {
          healthRating = '偏轻';
        } else if (weight > 33.5) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }else if (height <= 138) {
        if (weight < 30) {
          healthRating = '偏轻';
        } else if (weight > 36.5) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }else if (height <= 142) {
        if (weight < 32.8) {
          healthRating = '偏轻';
        } else if (weight > 39.7) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }else if (height <= 146) {
        if (weight < 35.1) {
          healthRating = '偏轻';
        } else if (weight > 42.9) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }else if (height <= 150) {
        if (weight < 38) {
          healthRating = '偏轻';
        } else if (weight > 46.5) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }else if (height <= 154) {
        if (weight < 40.9) {
          healthRating = '偏轻';
        } else if (weight > 50) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }else if (height <= 158) {
        if (weight < 44.1) {
          healthRating = '偏轻';
        } else if (weight > 53.7) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }else if (height <= 162) {
        if (weight < 47.2) {
          healthRating = '偏轻';
        } else if (weight > 57.3) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }else if (height <= 166) {
        if (weight < 50.7) {
          healthRating = '偏轻';
        } else if (weight > 60.9) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }else if (height <= 170) {
        if (weight < 54) {
          healthRating = '偏轻';
        } else if (weight > 64.7) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }else if (height <= 174) {
        if (weight < 57.4) {
          healthRating = '偏轻';
        } else if (weight > 69.6) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }else if (height <= 180) {
        if (weight < 61) {
          healthRating = '偏轻';
        } else if (weight > 74.9) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }else if (height <= 184) {
        if (weight < 63.8) {
          healthRating = '偏轻';
        } else if (weight > 77.9) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }else if (height <= 188) {
        if (weight < 65.5) {
          healthRating = '偏轻';
        } else if (weight > 80.7) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
      }else if (height <= 190) {
        if (weight < 66) {
          healthRating = '偏轻';
        } else if (weight > 81.7) {
          healthRating = '偏重';
        } else {
          healthRating = '正常';
        }
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
                                  "健康评分：$healthRating",
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
