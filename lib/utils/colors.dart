import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:math' as math;

Color colorOne = Color.fromRGBO(170, 86, 197,1.0);
Color colorTwo = Color.fromRGBO(233, 101, 184,1.0);
Color colorThree = Colors.red[100];
Color colorBlue = Color.fromRGBO(45, 160, 240, 1.0);
Color colorCurve = Color.fromRGBO(97, 10, 165, 0.7);
Color colorDashboardCurve = Color.fromRGBO(223, 69, 104, 1.0);
Color colorDashboardCurve2 = Color.fromRGBO(240, 79, 133, 1.0);

Color backgroundColor =Colors.grey.shade200;

final gradient = new SweepGradient(
  startAngle: 3 * math.pi / 2,
  endAngle: 7 * math.pi / 2,
  tileMode: TileMode.repeated,
  colors: [colorDashboardCurve, colorDashboardCurve2],
);

final appTheme = ThemeData(
  primarySwatch: Colors.red,
);