import 'package:flutter/material.dart';

class MyEighthPage extends StatefulWidget {
  MyEighthPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyEighthPageState createState() => _MyEighthPageState();
}

class _MyEighthPageState extends State<MyEighthPage> {
  void initState() {
    super.initState();
    //activityList = Recommendataion.getFoodList();
  }

  var activityList = [
  {
      "name" : "Bread",
    "image" : "https://lh3.googleusercontent.com/proxy/wtqY1ThjGPtYU6fzx_pJ0rPyGF-svFNEyhegBA0f3mrjeFst_yxW8Idct3Ocpk29HeqT5rLdmcNR_GaIPWL1j1yt2_kfLgM8v4uz_7bMAm9i7DKg4YANdNwTzEcecSrc86m88kL1bOyD48GR-_2uYFJlnVZ6Qm4",
    },
    {
    "name" : "egg",
    "image" : "https://cdn.iconscout.com/icon/free/png-256/egg-21-108383.png",
    },
    {
    "name" : "milk",
    "image" : "https://cdn.iconscout.com/icon/premium/png-256-thumb/milk-1637594-1387047.png",
    },
    {
    "name" : "bacon",
    "image" : "https://cdn.iconscout.com/icon/premium/png-256-thumb/bacon-23-565349.png",
    },
    {
    "name" : "sausage",
    "image" : "https://cdn.iconscout.com/icon/premium/png-256-thumb/sausage-176-1051414.png",
    },
    {
    "name" : "pork",
    "image" : "https://img.icons8.com/cotton/2x/steak-rare.png",
    },
    {
    "name" : "chicken",
    "image" : "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRfM5V0hpPJGa9GVkIBVJX2m-dDP0qY-EhcJdyZo9weoWkjm-qE",
    },
];



@override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(

        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(left:50, top: 30,bottom: 30),
                    child:Text(
                      "Food List",
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),


              ],
            ),


            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: activityList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: (){
                        print("clicked!");
                        Navigator.pop(context,activityList[index]);
                      },
                      title:Container(
                        height: 50,
                        child: Center(
                          child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    child:
                                    Image.network(activityList[index]['image']),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin: EdgeInsets.only(right: 30),
                                    child:Text(
                                      activityList[index]['name'],
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),

                              ]
                          ),
                        ),
                      ),
                    );
                  }
              ),
            ),

          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
