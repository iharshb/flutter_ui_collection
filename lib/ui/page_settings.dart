import 'package:flutter/material.dart';
import 'package:flutter_ui_collections/utils/utils.dart';
import 'package:flutter_ui_collections/widgets/widgets.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Container(
        color: backgroundColor,
        child: Column(

          children: <Widget>[

            TileRow(
              backgroundColor: Colors.white,
              label: "Push Notification",
                disableDivider: true,
                onTap: (){

              },
            ),
            TileRow(
              backgroundColor: Colors.white,
              label: "Push Notification",
              disableDivider: true,
              onTap: (){

              },
            ),
            TileRow(
              backgroundColor: Colors.white,
              label: "Push Notification",
              disableDivider: true,
              onTap: (){

              },
            ),
            TileRow(
              backgroundColor: Colors.white,
              label: "Push Notification",
              disableDivider: true,
              onTap: (){

              },
            ),


          ],

        ),
      ),
    );
  }
}
