import 'package:flutter/material.dart';
import 'package:stream_tutorial_dec_2020/constants.dart';

class TextWithValue extends StatelessWidget {
  final String title;
  final String value;

  const TextWithValue({Key key, this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'callofduty'),
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'callofduty',
            fontSize: 20,
            color: Pallete.swatchG,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
