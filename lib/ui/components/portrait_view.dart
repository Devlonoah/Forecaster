import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/src/provider.dart';

import '../../blocs/weathercubit/weather_cubit.dart';
import '../../constants.dart';
import 'city_and_date.dart';
import 'tem_and_coord_and_description.dart';
import 'weather_info_details.dart';

Widget buildPortrait({WeatherState state, BuildContext context}) {
  var mediaqSize = MediaQuery.of(context).size;
  if (state is WeatherLoadFailure) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Material(
            color: Colors.black54,
            elevation: 10.0,
            child: InkWell(
              onTap: () => context
                  .read<WeatherCubit>()
                  .fetchWeatherDataForCurrentLocation(),
              child: Padding(
                padding: EdgeInsets.all(20.r),
                child: Icon(
                  FontAwesomeIcons.satellite,
                  size: 25.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        addVerticalSpace(20),
        Text(
          'RETRY',
          style: TextStyle(
            fontFamily: 'callofduty',
            fontSize: 14.sp,
            color: Colors.white70,
          ),
        ),
      ]),
    );
  }
  if (state is WeatherLoadSuccessful) {
    final _data = state.weatherData;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          cityAndDate(_data),
          tempAndCoordAndDescription(data: _data),
          weatherInfoDetails(_data)
        ],
      ),
    );
  }

  return Center(
    child: CircularProgressIndicator(
      backgroundColor: Pallete.GOLD_COLOR,
      color: Colors.black,
      strokeWidth: 5,
    ),
  );
}
