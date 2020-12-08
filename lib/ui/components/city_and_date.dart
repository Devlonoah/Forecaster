import 'package:flutter/material.dart';

Column cityAndDate(dynamic data) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Dubai',
        style: TextStyle(
          fontFamily: 'callofduty',
          fontSize: 50,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        'Wednesday-29 May',
        style: TextStyle(
          fontFamily: 'callofduty',
          fontSize: 17,
          fontWeight: FontWeight.w300,
        ),
      ),
    ],
  );
}
