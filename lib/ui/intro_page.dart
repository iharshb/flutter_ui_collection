import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  String assetImage;
  String centerText;

  IntroPage(this.assetImage, this.centerText);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(assetImage),
        ),
      ),
      child: Center(

        child: Column(

          children: <Widget>[

            FlutterLogo(
              size: 60.0,
            ),
            Text(
              centerText,
              style:
              Theme
                  .of(context)
                  .textTheme
                  .body1
                  .copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
