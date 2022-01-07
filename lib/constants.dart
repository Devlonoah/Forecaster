import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final valueTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontFamily: 'microfont');

final headerTextStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Colors.blue,
    fontFamily: 'microfont');

//...............

class Pallete {
  static final swatchA = Color(0xFF191919);
  static final swatchB = Color(0xFFa10600);
  static final swatchC = Color(0xFF5b5b5b);
  static final swatchD = Color(0xFFcccccc);
  static final swatchE = Color(0xFF5e0b05);
  static final swatchF = Color(0xFFca0700);
  static final swatchG = Color(0xFF9d9d9d);
  // static const GOLD_COLOR = Color(0xFFFF0000);

  static const Color mainColor = Colors.black;

  static const textColor1 = Color(0XFFF5EDF0);
  static const textColor2 = Color(0XFFD1CCDC);
  static const GOLD_COLOR = Color(0xFFF3B61F);
  // ;
  static const DULL_WHITE = Colors.white70;

  static final GOLD_GRADIENT = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [Colors.white, Colors.white],
    ),
  );
}

addVerticalSpace(double height) {
  return SizedBox(height: height.h);
}

addHorizontalSpace(double width) {
  return SizedBox(width: width.w);
}
