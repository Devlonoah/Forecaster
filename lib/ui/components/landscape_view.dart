import 'package:flutter/material.dart';

import 'weather_forecast_card.dart';

Widget buildLandscape() {
  return Row(
    children: <Widget>[
      Container(
        color: Colors.white,
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
              Container(
                height: 130,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: 20,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: WeatherForecastCard(
                          icon: 'icon',
                          title: 'title',
                          value: 20.0,
                        ),
                      );
                    }),
              ),
              RaisedButton(
                color: Colors.yellow,
                child: Text('Get Weather Details'),
                onPressed: () {
//Fetch weather data from api

                  // Provider.of<WeatherBloc>(context, listen: false)
                  //     .fetchWeatherData();
                },
              )
            ],
          ),
        ),
      ),
    ],
  );
}
