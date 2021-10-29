import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:stream_tutorial_dec_2020/blocs/weathercubit/weather_cubit.dart';
import 'package:stream_tutorial_dec_2020/di.dart';

import 'ui/weather_dashboard.dart';

void main() {
  runApp(MyApp());
  initDi();
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<WeatherCubit>(
            create: (context) =>
                sl<WeatherCubit>()..fetchWeatherDataForCurrentLocation())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        theme: ThemeData.light().copyWith(
            primaryColor: Colors.black,
            accentColor: Colors.red,
            buttonColor: Colors.red),
        home: ScreenUtilInit(
          builder: () => FirstScreen(),
        ),
      ),
    );
  }
}
