import 'package:flutter/material.dart';
import 'package:flutter_ui_collections/utils/utils.dart';
import 'package:flutter_ui_collections/widgets/bottom_navigationBar.dart';

Color mainBGColor = Color(0xFF652A78);
Color redColor = Color(0xFFDE3C10);
Color purpleColor = Color(0xFF8132AD);
Color cyan = Color(0xFF99D5E5);
Color orange = Color(0xFFE97A4D);

class CustomPaintDemo extends StatefulWidget {
  @override
  _CustomPaintDemoState createState() => _CustomPaintDemoState();
}

class _CustomPaintDemoState extends State<CustomPaintDemo>
    with TickerProviderStateMixin {
  int currentIndex = 0;
  int currentTab = 0;
  TabController _tabController;

  _changeCurrentTab(int tab) {
    setState(() {
      currentTab = tab;
      _tabController.animateTo(0);
      //  _tabController = TabController(vsync: this, length: tabsList[currentTab].length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
            body: Container(
              color: backgroundColor,
            ),
            // This trailing comma makes auto-formatting nicer for build methods.
            bottomNavigationBar:
                BottomNavBar(changeCurrentTab: _changeCurrentTab)),
      ),
    );
  }
}

mainBackgroundPath(Canvas canvas, Size size, Paint paint) {
  Path mainBGPath = Path();

  mainBGPath.lineTo(0.0, size.height);
  var firstControlPoint = Offset(size.width / 4, size.height / 1.20);
  var firstEndPoint = Offset(size.width / 2.25, size.height);
  mainBGPath.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
      firstEndPoint.dx, firstEndPoint.dy);

  var secondControlPoint = Offset(
      size.width - (size.width / 3.50), size.height + (size.height / 3.50));
  var secondEndPoint = Offset(size.width, size.height + (size.height / 20));
  mainBGPath.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
      secondEndPoint.dx, secondEndPoint.dy);

  mainBGPath.lineTo(size.width, size.height);
  mainBGPath.lineTo(size.width, 0.0);
  paint.color = colorCurve;

  canvas.drawPath(mainBGPath, paint);
}

secondBAckgroundPath(Canvas canvas, Size size, Paint paint) {
  Path mainBGPath = Path();
  mainBGPath.moveTo(0.0, size.height / 2);
  mainBGPath.lineTo(0.0, size.height);

  var firstControlPoint = Offset(size.width / 4, size.height / 1.20);
  var firstEndPoint = Offset(size.width / 2.25, size.height);
  mainBGPath.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
      firstEndPoint.dx, firstEndPoint.dy);

  var secondControlPoint = Offset(
      size.width - (size.width / 3.50), size.height + (size.height / 3.50));
  var secondEndPoint = Offset(size.width, size.height + (size.height / 20));
  mainBGPath.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
      secondEndPoint.dx, secondEndPoint.dy);

  mainBGPath.lineTo(size.width, size.height);

  mainBGPath.quadraticBezierTo(
      size.width * .33, size.height * .3, 0, size.height / 1.5);

  paint.color = colorDashboardCurve2;
  canvas.drawPath(mainBGPath, paint);
}

thirdBackgroundPath(Canvas canvas, Size size, Paint paint) {
  Path mainBGPath = Path();

  mainBGPath.lineTo(0.0, size.height / 4);

  var firstControlPoint = Offset(size.width / 3, 0);
  var firstEndPoint = Offset(size.width / 1.45, size.height / 1.4);

  mainBGPath.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
      firstEndPoint.dx, firstEndPoint.dy);

  //mainBGPath.lineTo(size.width/1.50, size.height/1.4);

  mainBGPath.lineTo(size.width, 0);
  paint.color = Colors.blueAccent;
  canvas.drawPath(mainBGPath, paint);
}

purpleBackgroundPath(Canvas canvas, Size size, Paint paint) {
  Path purplePath = Path();
  purplePath.moveTo(0, size.height);
  purplePath.lineTo(size.width, size.height + (size.height / 20));
  purplePath.quadraticBezierTo(
      size.width * .33, size.height * .3, 0, size.height / 1.5);

  purplePath.lineTo(size.width / 2.25, size.height);

  var secondControlPoint = Offset(
      size.width - (size.width / 3.50), size.height + (size.height / 3.50));
  var secondEndPoint = Offset(size.width, size.height + (size.height / 20));
  purplePath.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
      secondEndPoint.dx, secondEndPoint.dy);

  purplePath.lineTo(0, size.height);

  var firstControlPoint = Offset(size.width / 4, size.height / 1.20);
  var firstEndPoint = Offset(0, size.height);

  purplePath.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
      firstEndPoint.dx, firstEndPoint.dy);
  purplePath.close();
  paint.color = Colors.black26;
  canvas.drawPath(purplePath, paint);
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Paint paint = Paint();
    // mainBackgroundPath(canvas,size,paint);
    // secondBAckgroundPath(canvas,size,paint);
    // thirdBackgroundPath(canvas,size,paint);

    Paint paint = Paint();

    Path mainBGPath = Path();
    mainBGPath.addRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height));
    paint.color = mainBGColor;
    canvas.drawPath(mainBGPath, paint);

    Path purplePath = Path();
    purplePath.lineTo(size.width * .45, 0);
    purplePath.quadraticBezierTo(
        size.width * .25, size.height * .3, 0, size.height * 0.55);
    purplePath.close();
    paint.color = purpleColor;
    canvas.drawPath(purplePath, paint);

    Path redPath = Path();
    redPath.moveTo(size.width * 0.9, 0.0);
    redPath.quadraticBezierTo(
        size.width * .5, size.height * 0.1, 0, size.height * 0.85);
    redPath.lineTo(0, size.height);
    redPath.lineTo(size.width * 0.25, size.height);
    redPath.quadraticBezierTo(
        size.width * .5, size.height * 0.7, size.width, size.height * 0.6);
    redPath.lineTo(size.width, 0.0);
    redPath.close();
    paint.color = purpleColor;
    canvas.drawPath(redPath, paint);

    /*  Path orangePath = Path();
    orangePath.moveTo(0, size.height * 0.75);
    orangePath.quadraticBezierTo(size.width * .25, size.height * 0.85, size.width * .40, size.height);
    orangePath.lineTo(0, size.height);
    orangePath.close();
    paint.color = orange;
    canvas.drawPath(orangePath, paint);*/
/*
    Path trianglePath = Path();
    trianglePath.lineTo(size.width *.25, 0);
    trianglePath.lineTo(0, size.height * .25);
    trianglePath.close();
    paint.color = cyan;
    canvas.drawPath(trianglePath, paint);*/
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
