import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';
import '../../model/weather_response.dart';

Column cityAndDate(WeatherResponse data) {
  String textFormat(String text) {
    if (text.length >= 14) {
      return text.substring(0, text.length) + "...";
    }
    return text;
  }

  final dateTime = DateTime.now();

  final DateFormat dateFormat = DateFormat('EEEE-d-MMMM');
  String currentDate = dateFormat.format(dateTime);

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        // textFormat(data.name + 'LAgos').toString(),

        data.name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontFamily: 'callofduty',
          fontSize: 40.sp,
          color: Pallete.textColor1,
          fontWeight: FontWeight.bold,
        ),
      ),
      addVerticalSpace(10),
      Text(
        currentDate,
        style: TextStyle(
          fontFamily: 'callofduty',
          fontSize: 17.sp,
          color: Pallete.textColor2,
          fontWeight: FontWeight.w300,
        ),
      ),
    ],
  );
}
