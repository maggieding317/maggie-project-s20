import 'package:flutter/material.dart';
import 'fifthScreen.dart';

class MyFourthPage extends StatefulWidget {
  MyFourthPage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyFourthPageState createState() => _MyFourthPageState();
}

class _MyFourthPageState extends State<MyFourthPage> {

  var breakfastList = [
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
    }
  ];

  var lunchList = [
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
    }
  ];

  var dinnerList = [
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
    }
  ];
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
                       "早餐",
                       textAlign: TextAlign.left,
                     ),
                   ),
                 ),
               ],
             ),
             

             Expanded(
               child: ListView.builder(
                   padding: const EdgeInsets.all(8),
                   itemCount: breakfastList.length,
                   itemBuilder: (BuildContext context, int index) {
                     return Container(
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
                                     Image.network(breakfastList[index]['image']),
                                   ),
                                 ),
                                 Expanded(
                                   flex: 2,
                                   child: Container(
                                     margin: EdgeInsets.only(right: 30),
                                     child:Text(
                                       breakfastList[index]['name'],
                                       textAlign: TextAlign.left,
                                     ),
                                   ),
                                 ),

                               ]
                           ),
                       ),
                     );
                   }
               ),
             ),


             Row(
               children: <Widget>[
                 Expanded(
                   flex: 2,
                   child: Container(
                     margin: EdgeInsets.only(left:50, top: 30,bottom: 30),
                     child:Text(
                       "午餐",
                       textAlign: TextAlign.left,
                     ),
                   ),
                 ),
               ],
             ),

             Expanded(
               child: ListView.builder(
                   padding: const EdgeInsets.all(8),
                   itemCount: lunchList.length,
                   itemBuilder: (BuildContext context, int index) {
                     return Container(
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
                                    Image.network(lunchList[index]['image']),
                                 ),
                               ),
                               Expanded(
                                 flex: 2,
                                 child: Container(
                                   margin: EdgeInsets.only(right: 30),
                                   child:Text(
                                     lunchList[index]['name'],
                                     textAlign: TextAlign.left,
                                   ),
                                 ),
                               ),

                             ]
                         ),
                       ),
                     );
                   }
               ),
             ),

             Row(
               children: <Widget>[
                 Expanded(
                   flex: 2,
                   child: Container(
                     margin: EdgeInsets.only(left:50, top: 30,bottom: 30),
                     child:Text(
                       "晚餐",
                       textAlign: TextAlign.left,
                     ),
                   ),
                 ),
               ],
             ),

             Expanded(
               child: ListView.builder(
                   padding: const EdgeInsets.all(8),
                   itemCount: dinnerList.length,
                   itemBuilder: (BuildContext context, int index) {
                     return Container(
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
                                   Image.network(dinnerList[index]['image']),
                                 ),
                               ),
                               Expanded(
                                 flex: 2,
                                 child: Container(
                                   margin: EdgeInsets.only(right: 30),
                                   child:Text(
                                     dinnerList[index]['name'],
                                     textAlign: TextAlign.left,
                                   ),
                                 ),
                               ),

                             ]
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
