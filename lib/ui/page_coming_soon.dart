
import 'package:flutter/material.dart';
import 'package:flutter_ui_collections/utils/utils.dart';

class PageComingSoon extends StatefulWidget {
  @override
  _PageComingSoonState createState() => _PageComingSoonState();
}

class _PageComingSoonState extends State<PageComingSoon> {
  Screen size;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Search",
              style:
              TextStyle(fontFamily: "Exo2", color: backgroundColor)),
          backgroundColor: colorCurve,
        ),
        body: Center(
            child: Container(
                width: size.getWidthPx(300),
                height: size.getWidthPx(300),
                child: Image.asset("assets/icons/icn_coming_soon.png")))
    );
  }

}