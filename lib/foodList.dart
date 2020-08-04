import 'package:flutter/material.dart';
import 'package:flutter_app/recommendation.dart';

class FoodList extends StatefulWidget {
  FoodList({Key key, this.title,this.foodRecommendation}) : super(key: key);

  Recommendation foodRecommendation;
  final String title;

  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {


  @override
  void initState() {
    super.initState();
    foodList =widget.foodRecommendation.getFoodList();
  }

  var foodList = [];

//  var breakfast =[
//    {
//      "name" : "Bread",
//      "image" : "https://lh3.googleusercontent.com/proxy/wtqY1ThjGPtYU6fzx_pJ0rPyGF-svFNEyhegBA0f3mrjeFst_yxW8Idct3Ocpk29HeqT5rLdmcNR_GaIPWL1j1yt2_kfLgM8v4uz_7bMAm9i7DKg4YANdNwTzEcecSrc86m88kL1bOyD48GR-_2uYFJlnVZ6Qm4",
//    },
//    {
//      "name" : "egg",
//      "image" : "https://cdn.iconscout.com/icon/free/png-256/egg-21-108383.png",
//    },
//    {
//      "name" : "milk",
//      "image" : "https://cdn.iconscout.com/icon/premium/png-256-thumb/milk-1637594-1387047.png",
//    },
//    {
//      "name" : "bacon",
//      "image" : "https://cdn.iconscout.com/icon/premium/png-256-thumb/bacon-23-565349.png",
//    },
//    {
//      "name" : "sausage",
//      "image" : "https://cdn.iconscout.com/icon/premium/png-256-thumb/sausage-176-1051414.png",
//    },
//    {
//      "name" : "pork",
//      "image" : "https://img.icons8.com/cotton/2x/steak-rare.png",
//    },
//    {
//      "name" : "chicken",
//      "image" : "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRfM5V0hpPJGa9GVkIBVJX2m-dDP0qY-EhcJdyZo9weoWkjm-qE",
//    },
//
//  ];
//
//  var lunchList = [
//    {
//      "name" : "Bread",
//      "image" : "https://lh3.googleusercontent.com/proxy/wtqY1ThjGPtYU6fzx_pJ0rPyGF-svFNEyhegBA0f3mrjeFst_yxW8Idct3Ocpk29HeqT5rLdmcNR_GaIPWL1j1yt2_kfLgM8v4uz_7bMAm9i7DKg4YANdNwTzEcecSrc86m88kL1bOyD48GR-_2uYFJlnVZ6Qm4",
//    },
//    {
//      "name" : "egg",
//      "image" : "https://cdn.iconscout.com/icon/free/png-256/egg-21-108383.png",
//    },
//    {
//      "name" : "milk",
//      "image" : "https://cdn.iconscout.com/icon/premium/png-256-thumb/milk-1637594-1387047.png",
//    }
//  ];
//
//  var dinnerList = [
//    {
//      "name" : "Bread",
//      "image" : "https://lh3.googleusercontent.com/proxy/wtqY1ThjGPtYU6fzx_pJ0rPyGF-svFNEyhegBA0f3mrjeFst_yxW8Idct3Ocpk29HeqT5rLdmcNR_GaIPWL1j1yt2_kfLgM8v4uz_7bMAm9i7DKg4YANdNwTzEcecSrc86m88kL1bOyD48GR-_2uYFJlnVZ6Qm4",
//    },
//    {
//      "name" : "egg",
//      "image" : "https://cdn.iconscout.com/icon/free/png-256/egg-21-108383.png",
//    },
//    {
//      "name" : "milk",
//      "image" : "https://cdn.iconscout.com/icon/premium/png-256-thumb/milk-1637594-1387047.png",
//    }
//  ];




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

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
                   itemCount: foodList.length,
                   itemBuilder: (BuildContext context, int index) {
                     return ListTile(
                       onTap: (){
                         print("clicked!");
                         Navigator.pop(context,foodList[index]);
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
                                     Image.network(foodList[index]['image']),
                                   ),
                                 ),
                                 Expanded(
                                   flex: 2,
                                   child: Container(
                                     margin: EdgeInsets.only(right: 30),
                                     child:Text(
                                       foodList[index]['name'],
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
      );

  }
}
