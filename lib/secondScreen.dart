import 'package:flutter/material.dart';
import 'thirdScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyNextPage extends StatefulWidget {
  MyNextPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyNextPageState createState() => _MyNextPageState();
}

class _MyNextPageState extends State<MyNextPage> {

  _MyNextPageState(){
    loadProfileInfo();
  }

  var idTextFieldController = new TextEditingController();
  var weightTextFieldController = new TextEditingController();
  var heightTextFieldController = new TextEditingController();
  var headTextFieldController = new TextEditingController();
  var genderTextFieldController = new TextEditingController();
  var ageTextFieldController = new TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child:Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 235, 222, 100),
          ),
          child: Column(
            children: <Widget>[
              Text("Welcome"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:CrossAxisAlignment.center,

                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(right: 30),
                      child:Text(
                        "ID",
                        textAlign: TextAlign.right,
                      ),
                    ),

                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(right: 30,left: 30,top:15,bottom:15),
                      child: TextField(
                        controller: idTextFieldController,
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'ID',
                        ),
                      ),
                    ),
                  ),

                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(right: 30),
                      child:Text(
                        "体重",
                        textAlign: TextAlign.right,
                      ),
                    ),

                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(right: 30,left: 30,top:15,bottom: 15),
                      child: TextField(
                        controller: weightTextFieldController,
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '体重',
                        ),
                      ),
                    ),
                  ),

                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(right: 30),
                      child:Text(
                        "身高",
                        textAlign: TextAlign.right,
                      ),
                    ),

                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(right: 30,left: 30,top:15,bottom: 15),
                      child: TextField(
                        controller: heightTextFieldController,
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '身高',
                        ),
                      ),
                    ),
                  ),

                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(right: 30),
                      child:Text(
                        "头围",
                        textAlign: TextAlign.right,
                      ),
                    ),

                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(right: 30,left: 30,top:15,bottom: 15),
                      child: TextField(
                        controller: headTextFieldController,
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '头围',
                        ),
                      ),
                    ),
                  ),

                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(right: 30),
                      child:Text(
                        "性别",
                        textAlign: TextAlign.right,
                      ),
                    ),

                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(right: 30,left: 30,top:15,bottom: 15),
                      child: TextField(
                        controller: genderTextFieldController,
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '性别',
                        ),
                      ),
                    ),
                  ),

                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(right: 30),
                      child:Text(
                        "年龄",
                        textAlign: TextAlign.right,
                      ),
                    ),

                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(right: 30,left: 30,top:15,bottom: 15),
                      child: TextField(
                        controller: ageTextFieldController,
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '年龄',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              RaisedButton(
                onPressed: () {
                  print(idTextFieldController.text.toString());
                  saveProfileInfo();
                  print(weightTextFieldController.text.toString());
                  print(heightTextFieldController.text.toString());
                  print(headTextFieldController.text.toString());
                  print(genderTextFieldController.text.toString());
                  print(ageTextFieldController.text.toString());



                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyThirdPage(title: 'Third Page')),
                  );
                },
                child:
                const Text('Next', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
//        child: Column(
//          children: <Widget>[
//            Text("Welcome"),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              crossAxisAlignment:CrossAxisAlignment.center,
//
//              children: <Widget>[
//                Expanded(
//                  flex: 1,
//                  child: Container(
//                    margin: EdgeInsets.only(right: 30),
//                    child:Text(
//                      "ID",
//                      textAlign: TextAlign.right,
//                    ),
//                  ),
//
//                ),
//                Expanded(
//                  flex: 2,
//                  child: Container(
//                    margin: EdgeInsets.only(right: 30,left: 30,top:15,bottom:15),
//                    child: TextField(
//                      controller: idTextFieldController,
//                      obscureText: false,
//                      decoration: InputDecoration(
//                        border: OutlineInputBorder(),
//                        labelText: 'ID',
//                      ),
//                    ),
//                  ),
//                ),
//
//              ],
//            ),
//
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Expanded(
//                  flex: 1,
//                  child: Container(
//                    margin: EdgeInsets.only(right: 30),
//                    child:Text(
//                      "体重",
//                      textAlign: TextAlign.right,
//                    ),
//                  ),
//
//                ),
//                Expanded(
//                  flex: 2,
//                  child: Container(
//                    margin: EdgeInsets.only(right: 30,left: 30,top:15,bottom: 15),
//                    child: TextField(
//                      controller: weightTextFieldController,
//                      obscureText: false,
//                      decoration: InputDecoration(
//                        border: OutlineInputBorder(),
//                        labelText: '体重',
//                      ),
//                    ),
//                  ),
//                ),
//
//              ],
//            ),
//
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Expanded(
//                  flex: 1,
//                  child: Container(
//                    margin: EdgeInsets.only(right: 30),
//                    child:Text(
//                      "身高",
//                      textAlign: TextAlign.right,
//                    ),
//                  ),
//
//                ),
//                Expanded(
//                  flex: 2,
//                  child: Container(
//                    margin: EdgeInsets.only(right: 30,left: 30,top:15,bottom: 15),
//                    child: TextField(
//                      controller: heightTextFieldController,
//                      obscureText: false,
//                      decoration: InputDecoration(
//                        border: OutlineInputBorder(),
//                        labelText: '身高',
//                      ),
//                    ),
//                  ),
//                ),
//
//              ],
//            ),
//
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Expanded(
//                  flex: 1,
//                  child: Container(
//                    margin: EdgeInsets.only(right: 30),
//                    child:Text(
//                      "头围",
//                      textAlign: TextAlign.right,
//                    ),
//                  ),
//
//                ),
//                Expanded(
//                  flex: 2,
//                  child: Container(
//                    margin: EdgeInsets.only(right: 30,left: 30,top:15,bottom: 15),
//                    child: TextField(
//                      controller: headTextFieldController,
//                      obscureText: false,
//                      decoration: InputDecoration(
//                        border: OutlineInputBorder(),
//                        labelText: '头围',
//                      ),
//                    ),
//                  ),
//                ),
//
//              ],
//            ),
//
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Expanded(
//                  flex: 1,
//                  child: Container(
//                    margin: EdgeInsets.only(right: 30),
//                    child:Text(
//                      "性别",
//                      textAlign: TextAlign.right,
//                    ),
//                  ),
//
//                ),
//                Expanded(
//                  flex: 2,
//                  child: Container(
//                    margin: EdgeInsets.only(right: 30,left: 30,top:15,bottom: 15),
//                    child: TextField(
//                      controller: genderTextFieldController,
//                      obscureText: false,
//                      decoration: InputDecoration(
//                        border: OutlineInputBorder(),
//                        labelText: '性别',
//                      ),
//                    ),
//                  ),
//                ),
//
//              ],
//            ),
//
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Expanded(
//                  flex: 1,
//                  child: Container(
//                    margin: EdgeInsets.only(right: 30),
//                    child:Text(
//                      "年龄",
//                      textAlign: TextAlign.right,
//                    ),
//                  ),
//
//                ),
//                Expanded(
//                  flex: 2,
//                  child: Container(
//                    margin: EdgeInsets.only(right: 30,left: 30,top:15,bottom: 15),
//                    child: TextField(
//                      controller: ageTextFieldController,
//                      obscureText: false,
//                      decoration: InputDecoration(
//                        border: OutlineInputBorder(),
//                        labelText: '年龄',
//                      ),
//                    ),
//                  ),
//                ),
//              ],
//            ),
//            RaisedButton(
//              onPressed: () {
//                print(idTextFieldController.text.toString());
//                print(weightTextFieldController.text.toString());
//                print(heightTextFieldController.text.toString());
//                print(headTextFieldController.text.toString());
//                print(genderTextFieldController.text.toString());
//                print(ageTextFieldController.text.toString());
//
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context) => MyThirdPage(title: 'Third Page')),
//                );
//              },
//              child:
//                  const Text('Next', style: TextStyle(fontSize: 20)),
//            ),
//          ],
//        ),
      ),
    );
  }

  loadProfileInfo() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = await prefs.get("ID");
    idTextFieldController.text = id;
    String weight = await prefs.get("weight");
    weightTextFieldController.text = weight;
    String height = await prefs.get("height");
    heightTextFieldController.text = height;
    String head = await prefs.get("head");
    headTextFieldController.text = head;
    String gender = await prefs.get("gender");
    genderTextFieldController.text = gender;
    String age = await prefs.get("age");
    ageTextFieldController.text = age;
  }
  saveProfileInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("ID", idTextFieldController.text.toString());
    await prefs.setString("weight", weightTextFieldController.text.toString());
    await prefs.setString("height", heightTextFieldController.text.toString());
    await prefs.setString("head", headTextFieldController.text.toString());
    await prefs.setString("gender", genderTextFieldController.text.toString());
    await prefs.setString("age", ageTextFieldController.text.toString());
    await prefs.setBool("saved", true);
  }
}
