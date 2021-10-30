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
    fontFamily: 'callofduty');

//...............

class Pallete {
  static final swatchA = Color(0xFF191919);
  static final swatchB = Color(0xFFa10600);
  static final swatchC = Color(0xFF5b5b5b);
  static final swatchD = Color(0xFFcccccc);
  static final swatchE = Color(0xFF5e0b05);
  static final swatchF = Color(0xFFca0700);
  static final swatchG = Color(0xFF9d9d9d);
  static const GOLD_COLOR = Color(0xFFB4B214);

  static const DULL_WHITE = Colors.white70;

  static final GOLD_GRADIENT = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [Pallete.swatchA, Pallete.GOLD_COLOR],
    ),
  );
}

addVerticalSpace(double height) {
  return SizedBox(height: height.h);
}

addHorizontalSpace(double width) {
  return SizedBox(width: width.w);
}
