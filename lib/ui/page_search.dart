import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_collections/utils/utils.dart';
import 'package:flutter_ui_collections/widgets/widgets.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Screen size;
  int _selectedIndex = 1;

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
            child: Column(
              children: <Widget>[upperPart()],
            ),
          ),
        ),
      ),
    );
  }

  Widget upperPart() {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: UpperClipper(),
          child: Container(
            height: size.getWidthPx(240),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colorCurve, colorCurveSecondary],
              ),
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: size.getWidthPx(36)),
              child: Column(
                children: <Widget>[
                  titleWidget(),
                  SizedBox(height: size.getWidthPx(10)),
                  upperBoxCard(),
                ],
              ),
            ),
            leftAlignText(text: "Premium properties",leftPadding: size.getWidthPx(16),textColor: textPrimaryColor,fontSize: 16.0),
            HorizontalList(
              children: <Widget>[
                propertyCard("Omkar Lotus","Ahmedabad ", "hall_1.jpg","26.5 Cr"),
                propertyCard("Sandesh Heights","Baroda ", "hall_2.jpeg","11.5 Cr"),
                propertyCard("Sangath Heights","Pune ", "hall_2.jpeg","19.0 Cr"),
                propertyCard("Adani HighRise","Mumbai ", "hall_1.jpg","22.5 Cr"),
                propertyCard("N.G Tower","Gandhinagar ", "hall_2.jpeg","7.2 Cr"),

              ],
            ),

            leftAlignText(text: "Featured properties",leftPadding: size.getWidthPx(16),textColor: textPrimaryColor,fontSize: 16.0),
            HorizontalList(
              children: <Widget>[
                propertyCard("Omkar Lotus","Ahmedabad ", "feature_1.jpg","11.5 Cr"),
                propertyCard("Sandesh Heights","Baroda ", "feature_2.jpg","5.5 Cr"),
                propertyCard("Sangath Heights","Pune ", "feature_3.jpg","12.0 Cr"),
                propertyCard("Adani HighRise","Mumbai ", "feature_1.jpg","55.5 Cr"),
                propertyCard("N.G Tower","Gandhinagar ", "feature_2.jpg","1.2 Cr"),
              ],
            )


          ],
        ),
      ],
    );
  }

  Text titleWidget() {
    return Text("Which type of house\nwould you like to buy?",
        style: TextStyle(
            fontFamily: 'Exo2',
            fontSize: 24.0,
            fontWeight: FontWeight.w900,
            color: Colors.white));
  }

  Card upperBoxCard() {
    return Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsets.symmetric(
            horizontal: size.getWidthPx(20), vertical: size.getWidthPx(16)),
        borderOnForeground: true,
        child: Container(
          height: size.getWidthPx(150),
          child: Column(
            children: <Widget>[
              _searchWidget(),
              leftAlignText(text: "Top Cities :",leftPadding: size.getWidthPx(16),textColor: textPrimaryColor,fontSize: 16.0),

              HorizontalList(
                children: <Widget>[
                  buildChoiceChip(1, "Ahmedabad"),
                  buildChoiceChip(2, "Mumbai"),
                  buildChoiceChip(3, "Delhi "),
                  buildChoiceChip(4, "Chennai"),
                  buildChoiceChip(5, "Goa"),
                  buildChoiceChip(6, "Kolkata"),
                  buildChoiceChip(7, "Indore"),
                  buildChoiceChip(8, "Jaipur"),
                ],
              ),
            ],
          ),
        ));
  }

  BoxField _searchWidget() {
    return BoxField(
        controller: TextEditingController(),
        focusNode: FocusNode(),
        hintText: "Select by city, area or locality.",
        lableText: "Search...",
        obscureText: false,
        onSaved: (String val) {},
        icon: Icons.search,
        iconColor: colorCurve);
  }

  Padding leftAlignText({text,leftPadding, textColor,fontSize,fontWeight}) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(text,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontFamily: 'Exo2',
                fontSize: fontSize,
                fontWeight: fontWeight??FontWeight.w500,
                color: textColor)),
      ),
    );
  }

  Card propertyCard(titleText, subTitle, assetImageName,priceText) {
    return Card(
        elevation: 4.0,
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        borderOnForeground: true,
        child: Container(
            height: size.getWidthPx(150),
            width: size.getWidthPx(170),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0)),
                    child: Image.asset('assets/$assetImageName',
                        fit: BoxFit.fill)),
                SizedBox(height: size.getWidthPx(8)),
                leftAlignText(text: titleText,leftPadding: size.getWidthPx(8),textColor: colorCurve,fontSize: 14.0),
                leftAlignText(text: subTitle,leftPadding: size.getWidthPx(8),textColor: Colors.black54,fontSize: 12.0),
                SizedBox(height: size.getWidthPx(4)),
                leftAlignText(text: priceText,leftPadding: size.getWidthPx(8),textColor: colorCurve,fontSize: 14.0,fontWeight: FontWeight.w800),
              ],
            )));
  }

  Padding buildChoiceChip(index, chipName) {
    return Padding(
      padding: EdgeInsets.only(left: size.getWidthPx(8)),
      child: ChoiceChip(
        backgroundColor: backgroundColor,
        selectedColor: colorCurve,
        labelStyle: TextStyle(
            fontFamily: 'Exo2',
            color:
                (_selectedIndex == index) ? backgroundColor : textPrimaryColor),
        elevation: 4.0,
        padding: EdgeInsets.symmetric(
            vertical: size.getWidthPx(4), horizontal: size.getWidthPx(12)),
        selected: (_selectedIndex == index) ? true : false,
        label: Text(chipName),
        onSelected: (selected) {
          if (selected) {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
      ),
    );
  }
}
