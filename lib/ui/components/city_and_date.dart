import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';
import '../../model/weather_response.dart';

Column cityAndDate(WeatherResponse data, BuildContext context) {
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
        data.name.toUpperCase(),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context)
            .textTheme
            .headline4
            .copyWith(fontWeight: FontWeight.bold),
      ),
      addVerticalSpace(10),
      Text(
        currentDate,
        style: Theme.of(context)
            .textTheme
            .headline6
            .copyWith(color: Pallete.GOLD_COLOR),
      ),
    ],
  );
}
