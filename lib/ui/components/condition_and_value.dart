import 'package:flutter/material.dart';

import '../../constants.dart';

Container conditionAndValue({String condition, double value}) {
  return Container(
    height: 130,
    color: Colors.grey.withOpacity(0.3),
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
                condition == null
                    ? 'null'
                    : condition[0].toUpperCase() + condition.substring(1),
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
                  value == null ? 'null' : value.toStringAsFixed(0),
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
