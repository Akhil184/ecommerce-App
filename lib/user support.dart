import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vikretag/util/constant.dart';


class user extends StatefulWidget {

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<user> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("User Support"),
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 20.0),
    centerTitle: true,
    backgroundColor:primaryColor,
    ),
    body:SingleChildScrollView(
    child:Center(
    child:Column(
    children:[
    Padding(
    padding:EdgeInsets.only(top:10),
    child:Image.asset('assest/contact_us.png'),

    ),
      Padding(
        padding:EdgeInsets.only(top:40,left:10,right:10),
        child:Text('For any Queries or Support reach us at below numbers.',style:TextStyle(fontSize:20,fontWeight:FontWeight.normal,color:primaryColor),textAlign:TextAlign.justify),

      ),
      Padding(
        padding:EdgeInsets.only(top:50,left:20),
        child:Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment:CrossAxisAlignment.center,
          children: [
           //MainAxisAlignment:MainAxisAlignment.spaceBetween
            Icon(Icons.call,color:Colors.blue,),
            Text('\t\t+91 9827764598',style:TextStyle(fontSize:20,fontWeight:FontWeight.normal,color:primaryColor),textAlign:TextAlign.justify),
],
      ),
      ),
      Padding(
        padding:EdgeInsets.only(top:20,left:20),
        child:Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment:CrossAxisAlignment.center,
          children: [
            Icon(Icons.call,color:Colors.blue,),
            Text('\t\t+91 9229498554',style:TextStyle(fontSize:20,fontWeight:FontWeight.normal,color:primaryColor),textAlign:TextAlign.justify),
          ],
        ),
      ),
    ],
    ),
    ),
    ),
    );
  }
}