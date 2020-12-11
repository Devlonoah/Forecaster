import 'package:flutter/material.dart';
import 'package:stream_tutorial_dec_2020/constants.dart';
import 'package:stream_tutorial_dec_2020/model/weather_response.dart';

Column tempAndCoordAndDescription({WeatherResponse data}) {
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
                    data.main.temp.toStringAsFixed(0) + '°',
                    style: TextStyle(
                        fontFamily: 'callofduty',
                        fontSize: 50,
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
                    'Long: ${data.coord.lon}',
                    style: headerTextStyle.copyWith(
                      color: Pallete.swatchG,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Lat: ${data.coord.lat}',
                    style: headerTextStyle.copyWith(
                      color: Pallete.swatchG,
                      fontSize: 15,
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
            '${data.weather[0].description}',
            style: TextStyle(
                fontFamily: 'callofduty',
                fontSize: 20,
                color: Pallete.swatchD,
                fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text(
                '${data.main.tempMin}°c',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                width: 40,
                child: Divider(
                  color: Pallete.swatchA.withOpacity(0.5),
                  thickness: 5,
                ),
              ),
              Text('${data.main.tempMax}°c',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ))
            ],
          ),
        ],
      ),
    ],
  );
}
