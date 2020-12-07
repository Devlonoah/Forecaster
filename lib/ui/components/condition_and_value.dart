import 'package:flutter/material.dart';

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
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                    fontSize: 17),
              ),
              Text(
                condition[0].toUpperCase() + condition.substring(1),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
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
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  value.toStringAsFixed(0),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
