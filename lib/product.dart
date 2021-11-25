import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class product extends StatefulWidget {

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [

          Image.asset('assest/no_product.png'),

    Padding(
    padding:EdgeInsets.only(top:100),
child:Text("No Product Found"),
    ),
      ],
              ),
      
    );
  }
}