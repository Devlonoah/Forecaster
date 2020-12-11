import 'package:flutter/material.dart';
import 'package:stream_tutorial_dec_2020/model/weather_response.dart';
import 'package:intl/intl.dart';

Column cityAndDate(WeatherResponse data) {
  String textFormat(String text) {
    if (text.length >= 14) {
      return text.substring(0, 13);
    }
    return text;
  }

  final dateTime = DateTime.now();

  final DateFormat dateFormat = DateFormat('EEEE-d-MMMM');
  String currentDate = dateFormat.format(dateTime);
  //  Date dateFormatter =
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        textFormat(data.name + 'edefghgh').toString(),
        style: TextStyle(
          fontFamily: 'callofduty',
          fontSize: 45,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        currentDate,
        style: TextStyle(
          fontFamily: 'callofduty',
          fontSize: 17,
          fontWeight: FontWeight.w300,
        ),
      ),
    ],
  );
}
