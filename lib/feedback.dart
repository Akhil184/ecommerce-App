import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vikretag/util/constant.dart';


class feed extends StatefulWidget {

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedback"),
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
  padding:EdgeInsets.only(top:100,
  ),
),
        SizedBox(
          width:360,

        child:TextField(
          maxLines:10,
              maxLength:100,
              keyboardType:TextInputType.multiline ,
              decoration:InputDecoration(
    labelText: 'Feedback',
    labelStyle:TextStyle(color: Colors.black,fontSize:30),
    hintText:"Please give us your ideas,suggestions or requirement.",
    enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 1, color:primaryColor,),
      borderRadius:new BorderRadius.circular(20),
    ),

              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color:primaryColor),
                borderRadius:new BorderRadius.circular(20),

              ),

              ),
          

)
            ),
      Padding(
        padding:EdgeInsets.only(top:40),
      child:ButtonTheme(
        minWidth:370,
      child:RaisedButton.icon(
        onPressed:()=>{
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => feed()),
          ),
        },
        color:primaryColor,
        textColor:Colors.white,
        icon:Icon(Icons.feedback, color:Colors.white,),
        label:Text("Feedback"),
      ),
      ),
      ),
        ],

            ),

            ),
      ),
    );


  }
}