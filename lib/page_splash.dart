import 'dart:async';
import 'package:flutter/material.dart';
import 'LocalBindings.dart';
import 'ui/page_login.dart';
import 'ui/page_onboarding.dart';
import 'utils/Constants.dart';
import 'package:flare_flutter/flare_actor.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
       navigateFromSplash();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: FlareActor(
            "splashlogo/trophy.flr2d",
            animation: "Build and Fade Out",
          ),
        )
    );
  }

  Future navigateFromSplash () async {

    String isOnBoard = await LocalStorage.sharedInstance.readValue(Constants.isOnBoard);

      if(isOnBoard ==null || isOnBoard == "0"){
        //Navigate to OnBoarding Screen.
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnBoardingPage()));
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