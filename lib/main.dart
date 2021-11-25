// @dart=2.9
import 'package:animated_text_kit/animated_text_kit.dart';






import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'splash screen.dart';
import 'util/constant.dart';

void main() {
  runApp(MaterialApp(
    home:SplashScreen(),
    debugShowCheckedModeBanner:false,
  )
  );
}


class SplashScreen extends StatefulWidget {


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  redirect() {
    Future.delayed(Duration(seconds: 4), () async {




          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyApp()),
          );
    });
  }
  void initState() {
    // TODO: implement initState
    redirect();
    super.initState();
  }
  // @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: TextLiquidFill(
            loadDuration: Duration(seconds: 2),
            waveDuration: Duration(milliseconds: 1500),
            text: 'VikretaG',
            waveColor: primaryColor,
            boxBackgroundColor: Colors.white,
            textStyle: GoogleFonts.pacifico(
              fontSize: 55.0,
              fontWeight: FontWeight.bold,
            ),
            boxHeight: 300.0,
          ),
        ),
      ),
      bottomSheet: Container(
        // width: double.infinity,
        width: MediaQuery
            .of(context)
            .size
            .width,
        padding: const EdgeInsets.only(bottom: 15),
        height: 80,
        child: Column(children: [
          Container(
            width: 50,
            height: 40,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Image.asset('assest/india.png'),
            ),
          ),
          Text(
            'Make in India',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ]),
      ),
    );
  }
}

