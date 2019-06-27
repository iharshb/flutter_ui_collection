import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Constants.dart';

class Utils {
  static Future<bool> checkConnection() async {
    ConnectivityResult connectivityResult =
    await (Connectivity().checkConnectivity());
    if ((connectivityResult == ConnectivityResult.mobile) ||
        (connectivityResult == ConnectivityResult.wifi)) {
      return true;
    } else {
      return false;
    }
  }
  static bool isAndroidPlatform(){
    if (Platform.isAndroid) {
      return true;
      // Android-specific code
    } else if (Platform.isIOS) {
      // iOS-specific code
      return false;
    }
  }



  static void showAlert(
      BuildContext context, String title, String text, VoidCallback onPressed,bool cancelable) {
    var alert = Utils.isAndroidPlatform() ? AlertDialog: CupertinoAlertDialog (

      title: Text(title,overflow: TextOverflow.ellipsis,),

      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(text),
          ],
        ),
      ),

      actions: <Widget>[
        Utils.isAndroidPlatform()?FlatButton:CupertinoDialogAction(
            onPressed: onPressed,
            child: Text(
              "OK",
              style: TextStyle(color: Constants.clr_blue),
            ))
      ],
    );

    showDialog(
        context: context,
        barrierDismissible: cancelable,
        builder: (_) {
          return alert;
        });
  }

  static void showOkCancelAlert(
      BuildContext context, String title, String text, VoidCallback onPressed) {
    var alert = AlertDialog(
      title: Text(title),
      content: Container(
        child: Row(
          children: <Widget>[Text(text)],
        ),
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: onPressed,
            child: Text(
              "OK",
              style: TextStyle(color: Colors.black87),
            )),
        FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: TextStyle(color: Constants.clr_blue),
            ))
      ],
    );

    showDialog(
        context: context,
        builder: (_) {
          return alert;
        });
  }


  static int getColorHexFromStr(String colorStr)
  {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }


}