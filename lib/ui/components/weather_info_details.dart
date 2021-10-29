import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stream_tutorial_dec_2020/constants.dart';
import 'package:stream_tutorial_dec_2020/model/weather_response.dart';
import 'package:stream_tutorial_dec_2020/ui/components/text_with_value.dart';

Column weatherInfoDetails(WeatherResponse data) {
  final dateFormat = DateFormat('hh:mm:ss');
  var sunriseDate =
      DateTime.fromMillisecondsSinceEpoch(data.sys.sunrise * 1000);
  var sunset = DateTime.fromMillisecondsSinceEpoch(data.sys.sunset * 1000);

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextWithValue(
        title: 'Sunset',
        value: dateFormat.format(sunset),
      ),
      addVerticalSpace(10),
      TextWithValue(title: 'Sunrise', value: dateFormat.format(sunriseDate)),
      addVerticalSpace(10),
      TextWithValue(
        title: 'Humidity',
        value: data.main.humidity.toStringAsFixed(1),
      ),
      addVerticalSpace(10),
      TextWithValue(
        title: 'Wind speed',
        value: data.wind.speed.toString(),
      )
    ],
  );
}
