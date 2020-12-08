import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stream_tutorial_dec_2020/blocs/weather_blocs.dart';
import 'package:stream_tutorial_dec_2020/ui/components/tem_and_coord_and_description.dart';
import 'package:stream_tutorial_dec_2020/ui/components/weather_info_details.dart';

import 'city_and_date.dart';

Widget buildPortrait({WeatherBloc bloc, BuildContext context}) {
  // WeatherBloc bloc1 = WeatherBloc();
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    child: StreamBuilder(
      stream: bloc == null ? null : bloc.weatherData,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        if (snapshot.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              cityAndDate('hj'),
              tempAndCoordAndDescription(),
              weatherInfoDetails()
            ],
          );
        }

        return Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.black87,
          ),
        );
      },
    ),
  );
}

//  Spacer(),
//       Container(
//         height: 655,
//         width: double.infinity,
//         color: Colors.white54,
//         child: StreamBuilder<WeatherResponse>(
//           stream: bloc.weatherData,
//           builder: (context, snapshot) {
//             //,................
//             if (snapshot.data == null) {
//               return Text('null');
//             }

//             // if (snapshot.connectionState == ConnectionState.waiting) {
//             //   return CupertinoActivityIndicator(
//             //     animating: true,
//             //     radius: 30.0,
//             //   );

//             var data = snapshot.data;
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 Container(
//                   color: Colors.white,
//                   width: 200,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Text(
//                         '${data.temp.toStringAsFixed(0)}°c',
//                         style: valueTextStyle.copyWith(
//                             fontSize: 50, color: Colors.black),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   color: Colors.white38,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       SizedBox(
//                         height: 30,
//                       ),
//                       Text(
//                         data.cityName,
//                         // data == null ? 'city name' : data.cityName,
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w800,
//                         ),
//                       ),
//                       Text(
//                         data.country,
//                         // data == null ? 'country' : data.country,
//                         style: valueTextStyle,
//                       ),
//                       conditionAndValue(
//                           condition: data.description, value: data.windSpeed),
//                       conditionAndValue(
//                           condition: data.description, value: data.windSpeed),
//                       conditionAndValue(
//                           condition: data.description, value: data.windSpeed),
//                       RaisedButton(
//                         color: Colors.yellow,
//                         child: Text('Get Weather Details'),
//                         onPressed: () {},
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       )
