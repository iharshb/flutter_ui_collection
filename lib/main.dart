import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'page_splash.dart';
import 'ui/page_dashboard.dart';
import 'ui/page_login.dart';
import 'ui/page_onboarding.dart';
import 'utils/utils.dart';
void main() {

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: backgroundColor, // navigation bar color
    statusBarColor: backgroundColor, // status bar color
  ));

  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Collections',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CollectionApp(),
    );
  }
}



class CollectionApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Theme.of(context).primaryColor,
        ),
        home: SplashScreen()
    );
  }
}


