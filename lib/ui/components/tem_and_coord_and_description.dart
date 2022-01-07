import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';
import '../../model/weather_response.dart';

Widget tempAndCoordAndDescription(
    {WeatherResponse data, BuildContext context}) {
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
                    data.main.temp.toStringAsFixed(0) + ' °',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                    'c',
                    style: Theme.of(context).textTheme.headline3,
                  )
                ],
              ),
            ),
          ),
          FittedBox(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Long: ${data.coord.lon}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  addVerticalSpace(20),
                  Text(
                    'Lat: ${data.coord.lat}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      addVerticalSpace(20),
      WeatherReviewAndTempDiff(data: data),
    ],
  );
}

class WeatherReviewAndTempDiff extends StatelessWidget {
  const WeatherReviewAndTempDiff({
    @required this.data,
  });

  final WeatherResponse data;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 100.w,
          child: FittedBox(
            child: Text(
              '${data.weather[0].description}'.toUpperCase(),
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: Pallete.GOLD_COLOR, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        addHorizontalSpace(50),
        Expanded(
          child: FittedBox(
            child: Row(
              children: [
                Text(
                  '${data.main.tempMin.toStringAsFixed(1)}°c',
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                        color: Pallete.GOLD_COLOR,
                      ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12.w),
                  width: 10.w,
                  child: Divider(
                    color: Colors.white,
                    thickness: 4.h,
                  ),
                ),
                Text(
                  '${data.main.tempMax.toStringAsFixed(1)}°c',
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                        color: Pallete.GOLD_COLOR,
                      ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
