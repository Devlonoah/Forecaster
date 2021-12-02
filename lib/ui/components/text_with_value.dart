import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';

class TextWithValue extends StatelessWidget {
  final String title;
  final String value;

  const TextWithValue({Key key, this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 20.sp,
              color: Pallete.GOLD_COLOR,
              fontWeight: FontWeight.w600,
              fontFamily: 'callofduty'),
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'callofduty',
            fontSize: 20.sp,
            color: Pallete.GOLD_COLOR,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
