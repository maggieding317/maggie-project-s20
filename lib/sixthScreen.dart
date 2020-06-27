import 'package:flutter/material.dart';
import 'package:flutter_app/recommendation.dart';
import 'package:flutter_app/secondScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';

class MySixthPage extends StatefulWidget {
  MySixthPage({Key key, this.title,this.recommendationAct, this.recommendationFood}) : super(key: key);
  final String title;
  var recommendationAct;
  Recommendation recommendationFood;
  @override
  _MySixthPageState createState() => _MySixthPageState();
}

class _MySixthPageState extends State<MySixthPage> {

  var rating = 'N/A';
  var healthRating = 'N/A';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var  b = context;
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

  loadProfileInfo() async{
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
    if (_gender == 'female'){
      if ( int.parse(_head) <= 2 && int.parse(_height) <= 20 && int.parse(_age) <= 2 && int.parse(_weight) <=30 ){
              healthRating = "normal";
        } else {
          healthRating = "bad";
        }
    }else{
      if (_head <= 2 && _height <= 20 && _age <= 2 &&_weight <=30 ){
        healthRating = "normal";
      } else {
        healthRating = "bad";
      }
    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(

        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(

                    margin: EdgeInsets.only(right: 10),
                    alignment: Alignment.centerRight,
                    child:
                    CircleAvatar(
                      backgroundImage: NetworkImage("https://cdn4.iconfinder.com/data/icons/small-n-flat/24/user-alt-512.png"),
                      radius: 40,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(left:10, right: 30,top: 100,bottom: 100),
                    child:Text(
                      "$_id",
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            ),

            Row(
              children: <Widget>[
//                Expanded(
//                  flex: 1,
//                  child: Container(
//                    height: 80,
//                    width: 80,
//                    margin: EdgeInsets.only(right: 20),
//                    alignment: Alignment.centerRight,
//                    child:
//                    Image(
//                      image: AssetImage("assets/medium.jpg"),
//                    ),
//                  ),
//                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left:10,right: 30),
                    child:Text(
                      "health rating：$healthRating",
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left:10,right: 30),
                    child:Text(
                      "体重：$_weight",
                      textAlign: TextAlign.left,
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
                    margin: EdgeInsets.only(top:50,right: 50),
                    child:Text(
                      "身高：$_height",
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left:50,top:50),
                    child:Text(
                      "头围：$_head",
                      textAlign: TextAlign.left,
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
                    margin: EdgeInsets.only(top:50,right: 50),
                    child:Text(
                      "性别：$_gender",
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left:50,top:50,right: 30),
                    child:Text(
                      "年龄：$_age",
                      textAlign: TextAlign.left,
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
                    margin: EdgeInsets.only(top:50,bottom: 50),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) => MyNextPage(title: 'Second Page',recommendationActivity:widget.recommendationAct,foodRecommendation: widget.recommendationFood,)),
                        );
                      },
                      child: Text(
                        "Edit",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
