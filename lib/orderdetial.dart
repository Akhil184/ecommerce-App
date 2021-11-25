import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vikretag/util/constant.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'main.dart';
import 'model/getorder.dart';
import 'model/ordercancelled.dart';
import 'model/orderl.dart';
import 'splash screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class OrderDetail extends StatefulWidget {

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<OrderDetail> {
  Future<order> fetchAlbum() async {
    var response = await http
        .post(Uri.parse('http://vikretag.com/API/index.php/User/cancelOrder'),body: toMap());
    // Name=updateprofile.fromJson(json.decode(response.body)).name;
    if (response.statusCode == 200) {

//print(phone);
      Fluttertoast.showToast(
          msg: "cancel order",
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
      Fluttertoast.showToast(
          msg: "k",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0
      );
    }
    return order.fromJson(jsonDecode(response.body));
    // If the server did not return a 200 OK response,
    // then throw an exception.
  }
  Map toMap() {
    var map = new Map<String, dynamic>();
    map["ord_id"] =6.toString();
    map["user_id"]=11.toString();

    //map["user_id"]=1.toString();
    return map;
  }
  Future<getd> fetchAlbum1() async {
    var response = await http
        .post(Uri.parse('http://vikretag.com/API/index.php/User/getorderList?user_id=11'),body: toMap());
    // Name=updateprofile.fromJson(json.decode(response.body)).name;
    if (response.statusCode == 200) {

//print(phone);
      Fluttertoast.showToast(
          msg: "order detail",
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
      Fluttertoast.showToast(
          msg: "k",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0
      );
    }
    return getd.fromJson(jsonDecode(response.body));
    // If the server did not return a 200 OK response,
    // then throw an exception.
  }
  Map toMap1() {
    var map = new Map<String, dynamic>();
    map["ord_id"] =6.toString();
    map["user_id"]=11.toString();

    //map["user_id"]=1.toString();
    return map;
  }
  Future<gete> fetchAlbum2() async {
    var response = await http
        .post(Uri.parse('http://vikretag.com/API/index.php/User/getorderList?user_id=11'),body: toMap());
    // Name=updateprofile.fromJson(json.decode(response.body)).name;
    if (response.statusCode == 200) {

//print(phone);
      Fluttertoast.showToast(
          msg: "order list",
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
      Fluttertoast.showToast(
          msg: "k",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0
      );
    }
    return gete.fromJson(jsonDecode(response.body));
    // If the server did not return a 200 OK response,
    // then throw an exception.
  }
  Map toMap2() {
    var map = new Map<String, dynamic>();
    map["ord_id"] =6.toString();
    map["user_id"]=11.toString();

    //map["user_id"]=1.toString();
    return map;
  }


  //map["user_id"]=1.toString();

  void initState() {
    super.initState();
    fetchAlbum();
    fetchAlbum1();
    fetchAlbum2();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

          body:Center(
            child:Text("Orders not yet"),
          ),

    );
  }
}