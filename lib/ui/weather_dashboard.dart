import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../blocs/weathercubit/weather_cubit.dart';
import '../constants.dart';
import 'components/portrait_view.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _appBar = AppBar(
      elevation: 0,
      backgroundColor: Pallete.mainColor,
      title: Text(
        'Prewer',
        style: TextStyle(
          color: Pallete.textColor2,
          fontFamily: 'callofduty',
          fontWeight: FontWeight.bold,
          letterSpacing: 2.3,
          fontSize: 20.sp,
        ),
      ),
      actions: <Widget>[
        GestureDetector(
          onTap: () =>
              context.read<WeatherCubit>().fetchWeatherDataForCurrentLocation(),
          child: Container(
              margin: EdgeInsets.all(8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                // color: Pallete.swatchF.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: Icon(
                FontAwesomeIcons.satellite,
                size: 25.sp,
                color: Pallete.textColor2,
              )),
        )
      ],
    );
    return Scaffold(
      appBar: _appBar,
      body: BlocListener<WeatherCubit, WeatherState>(
        listener: (context, state) {
          if (state is WeatherLoadFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text(
                  state.message ?? 'Error',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 13.sp),
                ),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Pallete.GOLD_COLOR,
              ));
          }
        },
        child: Container(
          child: BlocBuilder<WeatherCubit, WeatherState>(
            cubit: BlocProvider.of<WeatherCubit>(context),
            builder: (context, state) =>
                buildPortrait(state: state, context: context),
          ),
        ),
      ),
    );
  }
}
