import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vikretag/orderdetial.dart';
import 'package:vikretag/util/constant.dart';

import 'main.dart';
import 'splash screen.dart';


class Order extends StatefulWidget {

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Order> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home:DefaultTabController(
        length:4,
      child:Scaffold(
      appBar: AppBar(
        title: Text("My orders"),
        bottom:TabBar(
          isScrollable:true,
        tabs: [
          Tab(text:"Orders Requested"),
      Tab(text:"Accepted Order"),
          Tab(text:"Orders Completed"),
          Tab(text:"Order Cancelled")
        ],
        ),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20.0),
        centerTitle: true,
        backgroundColor:primaryColor,
      ),
      body:TabBarView(
        children: [
          OrderDetail(),
          OrderDetail(),
          OrderDetail(),
          OrderDetail(),
            ],
          ),
      ),
    ),
        );
  }
}