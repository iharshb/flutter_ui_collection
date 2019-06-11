import 'package:flutter/material.dart';
import 'package:flutter_ui_collections/utils/utils.dart';

import 'tile_row.dart';

class SettingSection extends StatefulWidget {
  final String headerText;
  final double headerFontSize;
  final Color headerTextColor;
  final bool disableDivider;
  final Color backgroundColor;
  final Key key;
  final List<Widget> children;

  SettingSection({
    this.headerText,
    this.headerTextColor,
    this.headerFontSize,
    this.key,
    this.children,
    this.disableDivider,
    this.backgroundColor,
  });

  @override
  _SettingSectionState createState() => _SettingSectionState();
}

class _SettingSectionState extends State<SettingSection> {
  @override
  Widget build(BuildContext context) {
    Screen size = Screen(MediaQuery.of(context).size);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
              left: size.getWidthPx(20),
              top: size.getWidthPx(4),
              bottom: size.getWidthPx(4)),
          child: Text(widget.headerText,
              style: TextStyle(
                  fontFamily: 'Exo2',
                  fontSize: widget.headerFontSize ?? 16.0,
                  fontWeight: FontWeight.w500,
                  color: widget.headerTextColor ?? textPrimaryDarkColor)),
        ),
        Card(
            elevation: 4.0,
            margin: new EdgeInsets.symmetric(horizontal: size.getWidthPx(10), vertical: size.getWidthPx(6)),
            borderOnForeground: true,
            child: Column(
              children: widget.children,
            ))
      ],
    );
  }
}
