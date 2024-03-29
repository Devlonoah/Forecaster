import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/src/provider.dart';

import '../../blocs/weathercubit/weather_cubit.dart';
import '../../constants.dart';
import 'city_and_date.dart';
import 'tem_and_coord_and_description.dart';
import 'weather_info_details.dart';

Widget buildPortrait({WeatherState state, BuildContext context}) {
  if (state is WeatherLoadFailure) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Material(
            color: Pallete.GOLD_COLOR,
            elevation: 10.0,
            child: InkWell(
              onTap: () => context
                  .read<WeatherCubit>()
                  .fetchWeatherDataForCurrentLocation(),
              child: Padding(
                padding: EdgeInsets.all(20.r),
                child: Icon(
                  Icons.wifi_off_outlined,
                  size: 25.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        addVerticalSpace(20),
        Text(
          'TAP TO RETRY',
          style: TextStyle(
            fontFamily: 'callofduty',
            fontSize: 14.sp,
            color: Pallete.GOLD_COLOR,
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
          cityAndDate(_data, context),
          tempAndCoordAndDescription(data: _data, context: context),
          weatherInfoDetails(_data, context)
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
