import 'package:flutter/material.dart';
import 'package:stream_tutorial_dec_2020/constants.dart';
import 'package:stream_tutorial_dec_2020/model/weather_response.dart';

import 'weather_forecast_card.dart';

Widget buildLandscape({AsyncSnapshot<dynamic> snapshot}) {
  if (snapshot.hasError) {
    return Text('error fetching weather info');
  }
  if (snapshot.connectionState == ConnectionState.waiting) {
    return Column(
      children: [
        CircularProgressIndicator(),
        Text('Loading Weather info'),
      ],
    );
  }

  if (snapshot.hasData) {
    return Row(
      children: <Widget>[
        Container(
          color: Pallete.swatchD,
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '20c',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 80),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white38,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Text(
                  'city name',
                  // data == null ? 'city name' : data.cityName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'country name',
                  // data == null ? 'country' : data.country,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),

//               RaisedButton(
//                 color: Colors.yellow,
//                 child: Text('Get Weather Details'),
//                 onPressed: () {
// //Fetch weather data from api

//                   // Provider.of<WeatherBloc>(context, listen: false)
//                   //     .fetchWeatherData();
//                 },
//               )
              ],
            ),
          ),
        ),
      ],
    );
  } else {
    return Center(
        child: Text(
      'check your connection',
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        fontFamily: 'callofduty',
      ),
    ));
  }
}
