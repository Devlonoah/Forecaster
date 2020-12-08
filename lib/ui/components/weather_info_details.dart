import 'package:flutter/material.dart';
import 'package:stream_tutorial_dec_2020/ui/components/text_with_value.dart';

Column weatherInfoDetails() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextWithValue(
        title: 'Sunset',
        value: 'hello',
      ),
      TextWithValue(
        title: 'Sunrise',
        value: 'hello',
      ),
//      Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: [
//          TextWithValue(
//            title: 'Sunrise',
//            value: '20',
//          ),
//          TextWithValue(
//            title: 'SunSet',
//            value: '10',
//          ),
//        ],
//      ),
      TextWithValue(
        title: 'Humidity',
        value: '10',
      ),
      TextWithValue(
        title: 'Wind speed',
        value: '10',
      )
    ],
  );
}
