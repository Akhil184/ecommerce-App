import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vikretag/util/constant.dart';

List<String> disputeType = ["Order", "Other"];
class help extends StatefulWidget {

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<help> {
  String dropdownvalue = 'Dispute Related To.';
  var items =  ['Dispute Related To.','Orders','Other'];


  @override
  Widget build(BuildContext context) {
    onChanged: (String newvalue) {
      setState(() {
        dropdownvalue = newvalue;
      },
      );
    };
    return Scaffold(
      appBar: AppBar(
        title: Text("Help"),
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
              Image.asset('assest/help.png'),

Container(
  width:380,
              child:DropdownButtonFormField<String>(
                decoration:const InputDecoration(
                  border:OutlineInputBorder(),
                ),
                focusColor:Colors.white,
                icon:Icon(Icons.keyboard_arrow_down),
                value: dropdownvalue,
                //elevation: 5,
                items:items.map((String items){
                  return DropdownMenuItem(
                    value:items,
                    child:Text(items)
                  );
                }
                ).toList(),
                  onChanged:(String? newvalue) {
                    setState(() {
                      this.dropdownvalue = newvalue!;
                    });
                  },
              ),

),

          Padding(
            padding:EdgeInsets.only(top:40,
            ),
                child:SizedBox(
                    width:380,
                  child:TextField(
                    maxLines:5,
                    maxLength:100,
                    keyboardType:TextInputType.multiline ,
                    decoration:InputDecoration(
                      labelText: 'Dispute Details',
                      labelStyle:TextStyle(color: Colors.black,fontSize:30),
                      hintText:"Dispute Details.",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1
                          ,),
                        borderRadius:new BorderRadius.circular(20),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                        borderRadius:new BorderRadius.circular(20),

                      ),

                    ),


                  )
              ),
          ),
              Padding(
                padding:EdgeInsets.only(top:40),
                child:ButtonTheme(
                  minWidth:370,
                  child:RaisedButton.icon(
                    onPressed:()=>{

                    },
                    color:primaryColor,
                    textColor:Colors.white,
                    icon:Icon(Icons.feedback, color:Colors.white,),
                    label:Text("Submit"),
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