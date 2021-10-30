import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';
import '../../model/weather_response.dart';

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
                    data.main.temp.toStringAsFixed(0) + ' °',
                    style: TextStyle(
                        fontFamily: 'callofduty',
                        fontSize: 45.sp,
                        color: Pallete.swatchA,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'c',
                    style: TextStyle(
                        fontFamily: 'callofduty',
                        fontSize: 50.sp,
                        color: Pallete.swatchA,
                        fontWeight: FontWeight.bold),
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
                    style: headerTextStyle.copyWith(
                      color: Pallete.swatchG,
                      fontSize: 15.sp,
                    ),
                  ),
                  addVerticalSpace(20),
                  Text(
                    'Lat: ${data.coord.lat}',
                    style: headerTextStyle.copyWith(
                      color: Pallete.swatchG,
                      fontSize: 15.sp,
                    ),
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
              '${data.weather[0].description}',
              style: TextStyle(
                  fontFamily: 'callofduty',
                  fontSize: 15.sp,
                  color: Pallete.swatchD,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        addHorizontalSpace(50),
        Expanded(
          child: FittedBox(
            child: Row(
              children: [
                Text(
                  '${data.main.tempMin}°c',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white70,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12.w),
                  width: 10.w,
                  child: Divider(
                    color: Pallete.swatchA.withOpacity(0.5),
                    thickness: 4.h,
                  ),
                ),
                Text(
                  '${data.main.tempMax}°c',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white70,
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
