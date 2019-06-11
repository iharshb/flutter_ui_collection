import 'package:flutter/material.dart';
import 'package:flutter_ui_collections/utils/utils.dart';
import 'package:flutter_ui_collections/widgets/widgets.dart';


class TileRow extends StatelessWidget {

  final String label;
  final Color labelColor;
  final String rowValue;
  final String rowValueKey;
  final bool disableDivider;
  final bool disableTopDivider;
  final Color backgroundColor;
  final GestureTapCallback onTap;
  final Key key;
  final bool disabled;
  final bool isVisible;

   TileRow({
    this.label,
    this.key,
    this.labelColor,
    this.rowValue,
    this.rowValueKey,
    this.disableDivider,
    this.onTap,
    this.disabled = false,
    this.backgroundColor,
    this.isVisible = true,
    this.disableTopDivider = true
  });

  @override
  Widget build(BuildContext context) {
    Screen size = Screen(MediaQuery.of(context).size);

    return VisibleWidget(
      visibility: isVisible
          ? VisibilityFlag.visible
          : VisibilityFlag.gone,
      child: Column(
        children: <Widget>[
          VisibleWidget(
              visibility: disableTopDivider != true
                  ? VisibilityFlag.visible
                  : VisibilityFlag.gone,
              child: Divider(height: 1.0, indent: 10.0, color: dividerColor)
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: Container(
              key: key,
              color: backgroundColor,
              padding: EdgeInsets.only(right: size.getWidthPx(12),left: size.getWidthPx(2),bottom: size.getWidthPx(4),top: size.getWidthPx(4)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(size.getWidthPx(8)),
                      child: Text(label,
                          style: TextStyle(
                              fontFamily: 'Exo2',
                              fontSize: 14.0,
                              color: disabled
                                  ? disabledTextColour
                                  : labelColor ?? textPrimaryDarkColor
                          )
                      ),
                    ),
                  ),
                  rowValue == null || rowValue == ""
                      ? Icon(Icons.arrow_forward_ios,size: size.getWidthPx(12),)
                      : Expanded(
                    flex: 1,
                    child: Container(  // shows selected value next to arrow icon if !null
                      alignment: Alignment.centerRight,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(rowValue,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontFamily: 'Exo2',
                                      fontSize: 15.0,
                                      color: disabled
                                          ? disabledTextColour
                                          : labelColor ?? textPrimaryDarkColor
                                  ),
                                  key: Key(rowValueKey)
                              ),
                            ),
                          ),
                          SizedBox(width: size.getWidthPx(4)),
                          Icon(Icons.arrow_forward_ios,
                            size: size.getWidthPx(12),
                            color: disabled
                                ? disabledTextColour
                                : labelColor ?? textPrimaryDarkColor,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            onTap: disabled
                ? (){}
                : onTap,
          ),
          VisibleWidget(
              visibility: disableDivider != true
                  ? VisibilityFlag.visible
                  : VisibilityFlag.gone, // If last row remove divider
              child: Divider(height: 1.0, indent: size.getWidthPx(2), color: dividerColor)
          )
        ],
      ),
    );
  }
}
