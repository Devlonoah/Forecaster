import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';
import '../../model/weather_response.dart';

Widget cityAndDate(WeatherResponse data, BuildContext context) {
  final dateTime = DateTime.now();

  final DateFormat dateFormat = DateFormat('EEEE-d-MMMM');
  String currentDate = dateFormat.format(dateTime);

  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.name.toUpperCase(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .headline6
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
        ),
      ),
      Container(
        decoration: BoxDecoration(
            color: Colors.white10, borderRadius: BorderRadius.circular(50)),
        padding: EdgeInsets.all(1),
        child: Center(
          child: Image.network(
            "https://openweathermap.org/img/wn/${data.weather.first.icon}@2x.png",
            height: 70,
            width: 70,
          ),
        ),
      )
    ],
  );
}
