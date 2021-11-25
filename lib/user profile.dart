import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vikretag/model/updateprofile.dart';
import 'package:vikretag/util/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class userprofile extends StatefulWidget {
  final String user_id;
  userprofile({Key? key,required this.user_id}):super(key:key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<userprofile> {
  late final String phone,name,user_id,message;
  TextEditingController _mobile=new TextEditingController();
  TextEditingController _name=new TextEditingController();
  Future<updateprofile> fetchAlbum() async {
    var response = await http
        .post(Uri.parse('http://vikretag.com/API/index.php/user'),body: toMap());

    if (response.statusCode == 200) {
      user_id = updateprofile.fromJson(json.decode(response.body)).user_id;
      name = updateprofile.fromJson(json.decode(response.body)).name;
      phone = updateprofile.fromJson(json.decode(response.body)).phone;

      print(user_id);
      print(name);
      print(phone);
      Fluttertoast.showToast(
          msg: "User Profile Updated",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0
      );



      // If the server did return a 200 OK response,
      // then parse the JSON.
    } else {
      message = updateprofile.fromJson(json.decode(response.body)).message;
      Fluttertoast.showToast(
          msg:message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0
      );
    }
    return updateprofile.fromJson(jsonDecode(response.body));
    // If the server did not return a 200 OK response,
    // then throw an exception.
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["phone"] = _mobile.text.toString();
    map["user_id"]=widget.user_id.toString();
    map["name"]=_name.text.toString();
    //map["user_id"]=1.toString();
    return map;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
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
                padding:EdgeInsets.only(top:30,
                ),
              ),
              SizedBox(
                  width:360,

                  child:TextField(
                    controller:_name,
                    maxLines:1,
                    maxLength:10,
                    keyboardType:TextInputType.text ,
                    decoration:InputDecoration(
                      labelText: 'Name',
                      labelStyle:TextStyle(color: Colors.black,fontSize:20),
                      hintText:"Type your name.",
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
              Padding(
                padding:EdgeInsets.only(top:30,
                ),
              ),
              SizedBox(
                  width:360,

                  child:TextField(
                    controller:_mobile,
                   enabled:false,
                    maxLines:1,
                    maxLength:10,
                    keyboardType:TextInputType.text ,
                    decoration:InputDecoration(
                      labelText:"enter mobile no",
                      labelStyle:TextStyle(color: Colors.black,fontSize:20),
                      hintText:"Type your No.",
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
              Padding(
                padding:EdgeInsets.only(top:40),
                child:ButtonTheme(
                  minWidth:370,
                  child:RaisedButton.icon(
                    onPressed:()=>{
fetchAlbum(),
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