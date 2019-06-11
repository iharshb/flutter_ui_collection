import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_collections/utils/utils.dart';
import 'package:flutter_ui_collections/widgets/visibility.dart';

class SwitchRow extends StatelessWidget {
  final String label;
  final Color labelColor;
  final bool disableDivider;
  final Color backgroundColor;
  final GestureTapCallback onTap;
  final ValueChanged<bool> onSwitchChange;
  final Key key;
  final bool disabled;
  final bool value;
  final bool isVisible;

  SwitchRow({
    this.label,
    this.key,
    this.value,
    this.labelColor,
    this.disableDivider,
    this.onTap,
    this.onSwitchChange,
    this.disabled = false,
    this.backgroundColor,
    this.isVisible = true,
  });

  @override
  Widget build(BuildContext context) {
    Screen size = Screen(MediaQuery.of(context).size);

    return VisibleWidget(
      visibility: isVisible ? VisibilityFlag.visible : VisibilityFlag.gone,
      child: Column(
        children: <Widget>[
          GestureDetector(
            child: Container(
              key: key,
              color: backgroundColor,
              padding: EdgeInsets.only(
                  right: size.getWidthPx(12), left: size.getWidthPx(2)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        right: size.getWidthPx(12), left: size.getWidthPx(12)),
                    child: Text(label,
                        style: TextStyle(
                            fontFamily: 'Exo2',
                            fontSize: 14.0,
                            color: disabled
                                ? disabledTextColour
                                : labelColor ?? textPrimaryDarkColor)),
                  ),
                  Platform.isAndroid
                      ? Switch(value: value, onChanged: onSwitchChange)
                      : CupertinoSwitch(value: value, onChanged: onSwitchChange)
                ],
              ),
            ),
            onTap: disabled ? () {} : onTap,
          ),
          VisibleWidget(
              visibility: disableDivider != true
                  ? VisibilityFlag.visible
                  : VisibilityFlag.gone, // If last row remove divider
              child: Divider(
                  height: 1.0, indent: size.getWidthPx(2), color: dividerColor))
        ],
      ),
    );
  }
}
