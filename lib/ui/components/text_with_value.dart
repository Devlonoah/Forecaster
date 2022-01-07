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
          title.toUpperCase(),
          style: TextStyle(
            fontSize: 20.sp,
            color: Pallete.GOLD_COLOR,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyText2.copyWith(
                fontSize: 20.sp,
                color: Pallete.GOLD_COLOR,
                fontWeight: FontWeight.bold,
              ),
        )
      ],
    );
  }
}
