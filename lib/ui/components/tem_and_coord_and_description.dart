import 'package:flutter/material.dart';
import 'package:stream_tutorial_dec_2020/constants.dart';

Column tempAndCoordAndDescription({dynamic data}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Row(
                children: [
                  Text(
                    '18°',
                    style: TextStyle(
                        fontFamily: 'callofduty',
                        fontSize: 130,
                        color: Pallete.swatchA,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'c',
                    style: TextStyle(
                        fontFamily: 'callofduty',
                        fontSize: 70,
                        color: Pallete.swatchA,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: 130,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Long: 12',
                    style: headerTextStyle.copyWith(
                      color: Pallete.swatchG,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Lat: 32',
                    style: headerTextStyle.copyWith(
                      color: Pallete.swatchG,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'The cloud is bright.',
            style: TextStyle(
                fontFamily: 'callofduty',
                fontSize: 20,
                color: Pallete.swatchD,
                fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text(
                '18°',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Pallete.swatchG),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                width: 40,
                child: Divider(
                  color: Pallete.swatchA.withOpacity(0.5),
                  thickness: 5,
                ),
              ),
              Text(
                '28°',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Pallete.swatchG),
              )
            ],
          ),
        ],
      ),
    ],
  );
}
