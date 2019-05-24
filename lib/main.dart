import 'package:flutter/material.dart';
import 'ui/page_dashboard.dart';
void main() => runApp(MyApp());

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
        home: CustomPaintDemo()
    );
  }
}


