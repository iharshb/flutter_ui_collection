import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_collections/utils/utils.dart';
import 'package:flutter_ui_collections/widgets/widgets.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isLocalNotification = false;
  bool isPushNotification = true;
  bool isPrivateAccount = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Settings",
            style:
                TextStyle(fontFamily: "Exo2", color: textSecondaryLightColor)),
        backgroundColor: Colors.white,
      ),
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle(
            statusBarColor: backgroundColor,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarIconBrightness: Brightness.light,
            systemNavigationBarColor: backgroundColor),
        child: Container(
          color: backgroundColor,
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: <Widget>[
                accountSection(),
                pushNotificationSection(),
                getHelpSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SettingSection getHelpSection() {
    return SettingSection(
      headerText: "Get Help".toUpperCase(),
      headerFontSize: 15.0,
      headerTextColor: Colors.black87,
      backgroundColor: Colors.white,
      disableDivider: false,
      children: <Widget>[
        Container(
          child: TileRow(
            label: "Contact Us",
            disableDivider: false,
            onTap: () {},
          ),
        ),
        Container(
          child: TileRow(
            label: "Terms and Condition",
            disableDivider: false,
            onTap: () {},
          ),
        ),
        Container(
          child: TileRow(
            label: "Feedback",
            disableDivider: false,
            onTap: () {},
          ),
        ),
        Container(
          child: TileRow(
            label: "Log out",
            disableDivider: false,
            onTap: () {},
          ),
        )
      ],
    );
  }

  SettingSection accountSection() {
    return SettingSection(
      headerText: "Account".toUpperCase(),
      headerFontSize: 15.0,
      headerTextColor: Colors.black87,
      backgroundColor: Colors.white,
      disableDivider: false,
      children: <Widget>[
        Container(
          child: TileRow(
            label: "User Name",
            disabled: true,
            rowValue: "harsh719",
            disableDivider: false,
            onTap: () {},
          ),
        ),
        Container(
          child: SwitchRow(
            label: "Private Account",
            disableDivider: false,
            value: isPrivateAccount,
            onSwitchChange: (switchStatus) {
              setState(() {
                switchStatus
                    ? isPrivateAccount = true
                    : isPrivateAccount = false;
              });
            },
            onTap: () {},
          ),
        ),
        Container(
          child: TileRow(
            label: "Change Password",
            disableDivider: false,
            onTap: () {},
          ),
        )
      ],
    );
  }

  SettingSection pushNotificationSection() {
    return SettingSection(
      headerText: "Push Notifications".toUpperCase(),
      headerFontSize: 15.0,
      headerTextColor: Colors.black87,
      backgroundColor: Colors.white,
      disableDivider: false,
      children: <Widget>[
        Container(
          child: SwitchRow(
            label: "Push Notification",
            disableDivider: false,
            value: isPushNotification,
            onSwitchChange: (switchStatus) {
              setState(() {
                switchStatus
                    ? isPushNotification = true
                    : isPushNotification = false;
              });
            },
            onTap: () {},
          ),
        ),
        Container(
          child: SwitchRow(
            label: "Local Notification",
            disableDivider: false,
            value: isLocalNotification,
            onSwitchChange: (switchStatus) {
              setState(() {
                switchStatus
                    ? isLocalNotification = true
                    : isLocalNotification = false;
              });
            },
            onTap: () {},
          ),
        )
      ],
    );
  }
}
