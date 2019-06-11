import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'page_splash.dart';
import 'ui/page_home.dart';
import 'ui/page_login.dart';
import 'ui/page_onboarding.dart';
import 'ui/page_settings.dart';
import 'utils/utils.dart';
import 'widgets/carousol.dart';
void main() {


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
        home: HomePage()
    );
  }
}


class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {





    return Scaffold(
      appBar: AppBar(title: Text("Title"),),
      body: Container(
        height: 400,
        child: Carroussel(),
      ),
    );



  }




}


