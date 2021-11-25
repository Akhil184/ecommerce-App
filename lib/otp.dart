import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:vikretag/util/constant.dart';
import './home.dart';
import 'model/otpmodel.dart';
import 'splash screen.dart';
import 'package:http/http.dart' as http;

import 'user profile.dart';

class Otp extends StatefulWidget {
final String phone;
final int ottp;

Otp({Key? key,required this.ottp,required this.phone}):super(key:key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  late String toast,message,user_id,name,phone;

Future<Otpmodel> fetchAlbum() async {
  var response = await http
      .post(Uri.parse('http://vikretag.com/API/index.php/Login/userVerifyotp'),body: toMap());

  if (response.statusCode == 200) {
    user_id = Otpmodel.fromJson(json.decode(response.body)).user_id;
     name = Otpmodel.fromJson(json.decode(response.body)).name;
    phone = Otpmodel.fromJson(json.decode(response.body)).phone;

print(user_id);
print(name);
print(phone);
    Fluttertoast.showToast(
        msg: "Otp verified",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0
    );
    var route=new MaterialPageRoute(builder: (BuildContext context)=>new MyApp5(user_id:user_id.toString()),
    );
    Navigator.of(context).push(route);


    // If the server did return a 200 OK response,
    // then parse the JSON.
  } else {
     message = Otpmodel.fromJson(json.decode(response.body)).message;
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
  return Otpmodel.fromJson(jsonDecode(response.body));
  // If the server did not return a 200 OK response,
  // then throw an exception.
}

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["mobile"] = widget.phone.toString();
    map["otp"]=toast.toString();

    return map;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.ottp);
    return Scaffold(
      appBar: AppBar(
        title:Text("Otp Verification") ,
        titleTextStyle:TextStyle(color: Colors.black,fontSize: 20.0),
        centerTitle: true,
        backgroundColor:primaryColor,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfff7f6fb),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,

              ),
              SizedBox(
                height: 18,
              ),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color:primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assest/auth.png',
                  width:80,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Verification',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter your OTP code number",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 22,
              ),
              Container(
                padding: EdgeInsets.all(28),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _textFieldOTP(),

                      ],
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          print(widget.ottp);
                         fetchAlbum();

                        },
                        style: ButtonStyle(
                          foregroundColor:
                          MaterialStateProperty.all<Color>(primaryColor),
                          backgroundColor:
                          MaterialStateProperty.all<Color>(primaryColor),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Text(
                            'Verify',
                            style: TextStyle(fontSize: 16,color:Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "Didn't you receive any code?",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "Resend New Code",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFieldOTP() {
    return Container(
      height: 85,
      width:270,
      child: AspectRatio(
        aspectRatio: 1.0,
        child:PinCodeTextField(
          appContext:context,
              length: 6,
              obscureText: false,
             animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
              ),
              animationDuration: Duration(milliseconds: 300),
              //backgroundColor: Colors.blue.shade50,
              enableActiveFill: true,

              onCompleted: (String v) {

toast=v;
              },
          onChanged: (value) {


          },
              beforeTextPaste: (text) {
                print("Allowing to paste $text");
                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                return true;
              },
            ),
        ),
      );



  }
}
