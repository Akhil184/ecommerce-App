import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vikretag/util/constant.dart';


class address extends StatefulWidget {

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<address> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Address"),
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
                child:Image.asset('assest/myLocation.png'),

              ),
              Padding(
                padding:EdgeInsets.only(top:40,left:10,right:10),
                child:Text('No address added yet.click add address button to add a address',style:TextStyle(fontSize:20,fontWeight:FontWeight.normal,color:primaryColor),textAlign:TextAlign.justify),

              ),
              Padding(
                padding:EdgeInsets.only(top:200,left:280),
               child:FloatingActionButton(
                 onPressed: () {  },
                 child:Icon(Icons.add),
                 backgroundColor:primaryColor,

              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}