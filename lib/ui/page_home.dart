import 'package:flutter/material.dart';
import 'package:flutter_ui_collections/widgets/bottom_navigationBar.dart';

import '../main.dart';
import 'page_login.dart';
import 'page_settings.dart';
import 'page_signup.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin {
  int currentTab = 0;
  PageController pageController;

  _changeCurrentTab(int tab) {
    setState(() {
      currentTab = tab;
      pageController.jumpToPage(0);
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: bodyView(currentTab),
          bottomNavigationBar: BottomNavBar(changeCurrentTab: _changeCurrentTab)),
    );
  }


  bodyView(currentTab) {

    List<Widget> tabView = [];
    //Current Tabs in Home Screen
    switch (currentTab) {
      case 0:
        tabView = [SettingPage()];
        break;
      case 1:
        tabView = [SignUpPage()];
        break;
      case 2:
        tabView = [TestScreen()];
        break;
      case 3:
        tabView = [SettingPage()];
        break;

    }
    return PageView(controller: pageController, children: tabView);
  }
}

