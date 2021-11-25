import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vikretag/util/constant.dart';


class about extends StatefulWidget {

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("About Us"),
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 20.0),
    centerTitle: true,
    backgroundColor:primaryColor,
    ),
    body:SingleChildScrollView(
    child:Center(
    child:Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment:CrossAxisAlignment.center,
    children:[
    Padding(
    padding:EdgeInsets.only(left:10,top:50),
    child:Container(
    width: 360,
    height: 200,
    decoration: BoxDecoration(
      borderRadius:BorderRadius.circular(10),
    border:Border.all(
      color:Colors.black,
    ),
    //shape: BoxShape.circle,
      color:Colors.white,
    ),
      child:Image.asset('assest/aboutus.png'),
    ),
    ),

Padding(
  padding:EdgeInsets.only(left:5,top:50,right:5),
      child:Text('VikretaG is a technology driven application based platform developed to connects hawkers and customers to serve/fulfil.',style:TextStyle(fontSize:20,fontWeight:FontWeight.normal),textAlign:TextAlign.justify,),
),

  Padding(
    padding:EdgeInsets.only(left:8,top:10,right:8),
  child:Text('VikretaG provides fresh fruits and vegetable to every house of society for healthier life of the people and save their time.',style:TextStyle(fontSize:20,color:Colors.black,fontWeight:FontWeight.normal),textAlign:TextAlign.justify,),
),
      Padding(
        padding:EdgeInsets.only(left:8,top:10,right: 8),
        child:Text('VikretaG not charge any amount neither from customers nor from vendors.it is the direct deal between vendors and customers.',style:TextStyle(fontSize:20,color:Colors.black,fontWeight:FontWeight.normal),textAlign:TextAlign.justify,),
      ),

      //Text('their basic needs.',style:TextStyle(fontSize:20)),
      //Text('.VikretaG is a technology driven application based platform developed to connects hawkers and customers to serve/fulfil '),
      ],
    ),
    ),

    ),
    );

  }
}