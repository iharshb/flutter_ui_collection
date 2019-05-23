
import 'dart:async';
import 'package:flutter/material.dart';
import 'LocalBindings.dart';
import 'ui/page_login.dart';
import 'ui/page_onboarding.dart';
import 'utils/Constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
       navigateFromSplash();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Expanded(
            child: FlutterLogo(
              size: 60.0,
            ),
          ),
        )
    );
  }

  Future navigateFromSplash () async {

    bool isOnBoard = await LocalStorage.sharedInstance.readValue(Constants.isOnBoard);

      if(isOnBoard ==null || isOnBoard){
        //Navigate to OnBoarding Screen.
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      }else{
        bool isLoggedIn = await LocalStorage.sharedInstance.readValue(Constants.isLoggedIn);
        //Navigate to DashBoard (If user already logged In) OR Login screen.
        if(isLoggedIn){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
        }else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
        }
      }
  }
}