import 'package:flutter/material.dart';
import 'package:stream_tutorial_dec_2020/constants.dart';

Container conditionAndValue({String condition, double value}) {
  return Container(
    height: 130,
    color: Colors.grey[100].withOpacity(0.3),
    width: double.infinity,
    child: Row(
      children: [
        Expanded(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Cloud Description',
                style: headerTextStyle,
              ),
              Text(
                condition[0].toUpperCase() + condition.substring(1),
                style: valueTextStyle,
              ),
            ],
          )),
        ),
        VerticalDivider(
          indent: 30,
          endIndent: 30,
          thickness: 5,
          color: Colors.amberAccent.withOpacity(0.8),
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Wind Speed',
                  style: headerTextStyle,
                ),
                Text(
                  value.toStringAsFixed(0),
                  style: valueTextStyle.copyWith(fontSize: 30),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
