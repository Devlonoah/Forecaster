import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stream_tutorial_dec_2020/blocs/weather_blocs.dart';
import 'package:stream_tutorial_dec_2020/ui/components/tem_and_coord_and_description.dart';
import 'package:stream_tutorial_dec_2020/ui/components/weather_info_details.dart';

import 'city_and_date.dart';

Widget buildPortrait(
    {WeatherBloc bloc, AsyncSnapshot<dynamic> snapshot, BuildContext context}) {
  var mediaqSize = MediaQuery.of(context).size;
  if (snapshot.hasError) {
    return Text(snapshot.error.toString());
  }
  if (snapshot.hasData) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      height: mediaqSize.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          cityAndDate(snapshot.data),
          tempAndCoordAndDescription(data: snapshot.data),
          weatherInfoDetails(snapshot.data)
        ],
      ),
    );
  }
  if (snapshot.error != null) {
    Center(
      child: Text(
        snapshot.error.toString(),
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  return Container(
    height: mediaqSize.height,
    child: Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.black87,
      ),
    ),
  );
}
