
import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'About us.dart';
import 'feedback.dart';
import 'feedback1.dart';
import 'home.dart';
import 'main.dart';
import 'model/loginmodel.dart';
import 'otp.dart';
import 'splash screen.dart';
import 'user support.dart';
import 'package:http/http.dart' as http;

import 'util/constant.dart';

void main() {
  runApp(MaterialApp(


    debugShowCheckedModeBanner:false,
  ));
}

class MyApp extends StatefulWidget{
  login createState() =>new login();
}
class login extends State<MyApp>{
  late var message,mobile;
  late int otp;




  TextEditingController _phone=new TextEditingController();

  Future<Loginmodel> fetchAlbum() async {
    var response = await http
        .post(Uri.parse('http://vikretag.com/API/index.php/Login/userlogin'),body: toMap());

    if (response.statusCode == 200) {
      print(response.statusCode);
      message = Loginmodel.fromJson(json.decode(response.body)).message;
      mobile = Loginmodel.fromJson(json.decode(response.body)).mobile;
      otp = Loginmodel.fromJson(json.decode(response.body)).otp;
      print(otp);
      // userid = LOGIN_MODEL.fromJson(json.decode(response.body)).;
      // username = LOGIN_MODEL.fromJson(json.decode(response.body)).;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('phone',mobile);
      Fluttertoast.showToast(
          msg: otp.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0
      );
      var route=new MaterialPageRoute(builder: (BuildContext context)=>new Otp(ottp:otp,phone:_phone.text.toString()),
      );
      Navigator.of(context).push(route);

      // If the server did return a 200 OK response,
      // then parse the JSON.
    } else {
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0
      );
    }
    return Loginmodel.fromJson(jsonDecode(response.body));
      // If the server did not return a 200 OK response,
      // then throw an exception.

    }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["mobile"] = _phone.text.toString();
    map["user_id"]=1.toString();
    print(1.toString());
    return map;
  }

  @override
  Widget build(BuildContext context){
    double height=MediaQuery.of(context).size.height;

    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

        Container(
        height:height/3,
          width:MediaQuery.of(context).size.width,
          margin:EdgeInsets.only(top:height/4),


              child:Image.asset("assest/auth.png",width:MediaQuery.of(context).size.width,
              ),
            ),
            Container(
              height:height/15,
            margin:EdgeInsets.only(top:height/4.5,left:2,right:2),
              child:TextFormField(
                controller: _phone,
                keyboardType:TextInputType.number,
                decoration:InputDecoration(
                  labelText: 'Enter Your Mobile No',
                  labelStyle:TextStyle(color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3),

                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3),

                  ),
                ),
              ),
            ),
      Container(
        margin:EdgeInsets.only(top:height/30,left:2,right:2),
              height:height/15,
              child:ButtonTheme(
                minWidth:MediaQuery.of(context).size.width,


                child:RaisedButton.icon(
                  onPressed:() {
                    fetchAlbum();
                  },
                  color:primaryColor,
                  textColor:Colors.white,
                  icon:Icon(Icons.call, color:Colors.white,),
                  label:Text("Get Otp"),
                  shape:RoundedRectangleBorder(
                    borderRadius:BorderRadius.circular(8)),
                ),
              ),
            ),
          ],
        ),
      ),

    );





  }

}




