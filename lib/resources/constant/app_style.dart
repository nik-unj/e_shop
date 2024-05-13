import 'package:flutter/material.dart';

class AppStyle {
  static EdgeInsets verysmallEdgeInsets = const EdgeInsets.all(5);
  static EdgeInsets smallEdgeInsets = const EdgeInsets.all(10);
  static EdgeInsets mediumEdgeInsets = const EdgeInsets.all(20);
  static EdgeInsets largeEdgeInsets = const EdgeInsets.all(50);
  static EdgeInsets vertical10EdgeInsets =
      const EdgeInsets.symmetric(vertical: 10);

  //color
  static Color primary = const Color.fromARGB(255, 250, 110, 32);
  static Color background = const Color.fromARGB(255, 255, 242, 235);
  static Color error = const Color(0xffba1a1a);
  static Color grey = const Color(0xff7a757f);
  static Color black = Colors.black;
  static Color white = Colors.white;
  static Color offWhite = const Color(0xffFAF9F6);
  static Color success = Colors.green;

  //sizes
  static double vsmallFontSize = 10;
  static double smallFontSize = 12;
  static double mediumFontSize = 14;
  static double largeFontSize = 16;
  static double xlargeFontSize = 20;

  //gap
  static Widget gapH(double size) {
    return SizedBox(height: size);
  }

  static Widget gapW(double size) {
    return SizedBox(width: size);
  }

  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  //TextStyle
  static TextStyle headingOrange() {
    return TextStyle(
      color: primary,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontFamily: 'Concert',
    );
  }

  static TextStyle textButton() {
    return TextStyle(
      color: grey,
      fontSize: 15,
      fontFamily: 'Oswald',
    );
  }

  static TextStyle normalText() {
    return TextStyle(
      color: white,
      fontSize: 15,
      fontWeight: FontWeight.w700,
      fontFamily: 'Concert',
    );
  }

  static TextStyle normalHeading() {
    return TextStyle(
      color: black,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontFamily: 'Bebas',
    );
  }

  static TextStyle priceStyle() {
    return TextStyle(
      color: grey,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontFamily: 'Bebas',
    );
  }

  static TextStyle textFieldStyle() {
    return TextStyle(
      color: AppStyle.white,
      fontSize: 15,
      fontFamily: 'Oswald',
    );
  }

  static TextStyle productName() {
    return TextStyle(
      color: primary,
      fontSize: 35,
      fontWeight: FontWeight.w700,
      fontFamily: 'Bebas',
    );
  }

  static TextStyle productPrice() {
    return TextStyle(
      color: black,
      fontSize: 20,
      fontFamily: 'Bebas',
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle productDesc() {
    return TextStyle(
      color: grey,
      fontSize: 16,
      fontFamily: 'Bebas',
    );
  }

  static TextStyle productBrand() {
    return TextStyle(
      color: black,
      fontSize: 20,
      fontWeight: FontWeight.w800,
      fontFamily: 'Oswald',
    );
  }

  static TextStyle productDiscount() {
    return TextStyle(
      color: primary,
      fontSize: 30,
      fontWeight: FontWeight.w800,
      fontFamily: 'Oswald',
    );
  }
}
