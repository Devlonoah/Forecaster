import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stream_tutorial_dec_2020/blocs/weather_blocs.dart';
import 'package:stream_tutorial_dec_2020/constants.dart';
import 'package:stream_tutorial_dec_2020/model/weatherItemModel.dart';
import 'package:stream_tutorial_dec_2020/ui/widget/weather_forecast_card.dart';

import 'condition_and_value.dart';

Column buildPortrait({WeatherBloc bloc, BuildContext context}) {
  WeatherBloc bloc1 = WeatherBloc();
  return Column(
    children: <Widget>[
      Spacer(),
      Container(
        height: 655,
        width: double.infinity,
        color: Colors.white54,
        child: StreamBuilder<WeatherItemModel>(
          initialData: WeatherItemModel(coord: 0.0),
          stream: bloc.weatherData,
          builder: (context, snapshot) {
            //,................
            if (snapshot.data == null) {
              return Text('null');
            }

            // if (snapshot.connectionState == ConnectionState.waiting) {
            //   return CupertinoActivityIndicator(
            //     animating: true,
            //     radius: 30.0,
            //   );

            var data = snapshot.data;
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  color: Colors.white,
                  width: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '${data.temp.toStringAsFixed(0)}°c',
                        style: valueTextStyle.copyWith(
                            fontSize: 50, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white38,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        data.cityName,
                        // data == null ? 'city name' : data.cityName,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        data.country,
                        // data == null ? 'country' : data.country,
                        style: valueTextStyle,
                      ),
                      conditionAndValue(
                          condition: data.description, value: data.windSpeed),
                      conditionAndValue(
                          condition: data.description, value: data.windSpeed),
                      conditionAndValue(
                          condition: data.description, value: data.windSpeed),
                      RaisedButton(
                        color: Colors.yellow,
                        child: Text('Get Weather Details'),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      )
    ],
  );
}
