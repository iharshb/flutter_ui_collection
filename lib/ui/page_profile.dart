import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_collections/ui/photo_list.dart';
import 'package:flutter_ui_collections/utils/utils.dart';
import 'package:flutter_ui_collections/widgets/utils_widget.dart';
import 'package:flutter_ui_collections/widgets/widgets.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Screen size;

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle(
        statusBarColor: backgroundColor,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: backgroundColor),
        child: Container(
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              children: <Widget>[upperPart()],
            ),
          ),
        ),
      ),
    );
  }

  Widget upperPart() {
    return Stack(children: <Widget>[
      ClipPath(
        clipper: UpperClipper(),
        child: Container(
          height: size.getWidthPx(150),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [colorCurve, colorCurve],
            ),
          ),
        ),
      ),
      Column(
        children: <Widget>[
          profileWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              followersWidget(),
              nameWidget(),
              likeWidget(),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.getWidthPx(8),
                left: size.getWidthPx(20),
                right: size.getWidthPx(20)),
            child: Container(height: size.getWidthPx(4), color: colorCurve),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buttonWidget("Follow "),
              buttonWidget("Chat"),
            ],
          ),
          leftAlignText(
              text: "Activities",
              leftPadding: size.getWidthPx(16),
              textColor: textPrimaryColor,
              fontSize: 14.0),
          PhotosList()
        ],
      )
    ]);
  }

  GestureDetector followerAvatarWidget(String assetIcon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        maxRadius: size.getWidthPx(24),
        backgroundColor: Colors.transparent,
        child: Image.asset(assetIcon),
      ),
    );
  }

  Container buttonWidget(text) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: size.getWidthPx(4), horizontal: size.getWidthPx(12)),
      child: RaisedButton(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(22.0)),
        padding: EdgeInsets.all(size.getWidthPx(2)),
        child: Text(
          text,
          style: TextStyle(
              fontFamily: 'Exo2', color: Colors.white, fontSize: 14.0),
        ),
        color: colorCurve,
        onPressed: () {},
      ),
    );
  }

  Align profileWidget() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(top: size.getWidthPx(60)),
        child: CircleAvatar(
          foregroundColor: backgroundColor,
          maxRadius: size.getWidthPx(50),
          backgroundColor: Colors.white,
          child: CircleAvatar(
            maxRadius: size.getWidthPx(48),
            foregroundColor: colorCurve,
            backgroundImage: NetworkImage(
                'https://avatars3.githubusercontent.com/u/17440971?s=400&u=b0d8df93a2e45812e577358cd66849e9d7cf0f90&v=4'),
          ),
        ),
      ),
    );
  }

  Column likeWidget() {
    return Column(
      children: <Widget>[
        Text("102.5k",
            style: TextStyle(
                fontFamily: "Exo2",
                fontSize: 16.0,
                color: textSecondary54,
                fontWeight: FontWeight.w700)),
        SizedBox(height: size.getWidthPx(4)),
        Text("Likes",
            style: TextStyle(
                fontFamily: "Exo2",
                fontSize: 14.0,
                color: textSecondary54,
                fontWeight: FontWeight.w500))
      ],
    );
  }

  Column nameWidget() {
    return Column(
      children: <Widget>[
        Text("Harsh Bhavsar",
            style: TextStyle(
                fontFamily: "Exo2",
                fontSize: 16.0,
                color: colorCurve,
                fontWeight: FontWeight.w700)),
        SizedBox(height: size.getWidthPx(4)),
        Text("Photographer",
            style: TextStyle(
                fontFamily: "Exo2",
                fontSize: 14.0,
                color: textSecondary54,
                fontWeight: FontWeight.w500))
      ],
    );
  }

  Column followersWidget() {
    return Column(
      children: <Widget>[
        Text("58k",
            style: TextStyle(
                fontFamily: "Exo2",
                fontSize: 16.0,
                color: textSecondary54,
                fontWeight: FontWeight.w700)),
        SizedBox(height: size.getWidthPx(4)),
        Text("Followers",
            style: TextStyle(
                fontFamily: "Exo2",
                fontSize: 14.0,
                color: textSecondary54,
                fontWeight: FontWeight.w500))
      ],
    );
  }
}
