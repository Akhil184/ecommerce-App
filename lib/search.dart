import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vikretag/model/updateprofile.dart';
import 'package:vikretag/util/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class search extends StatefulWidget {


  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<search> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                    maxLines:1,
                    textInputAction:TextInputAction.search,
                    keyboardType:TextInputType.text ,
                    decoration:InputDecoration(

                      labelStyle:TextStyle(color: Colors.black,fontSize:20),
                      hintText:"Search",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color:primaryColor,),
                        borderRadius:new BorderRadius.circular(10),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color:primaryColor),
                        borderRadius:new BorderRadius.circular(10),

                      ),

                    ),


                  )
              ),


            ],

          ),

        ),
      ),
    );


  }
 
    
  }
  class Search extends SearchDelegate<String>{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
IconButton(icon:Icon(Icons.clear),onPressed:(){}),
    ];

    // TODO: implement buildActions
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading


    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}
