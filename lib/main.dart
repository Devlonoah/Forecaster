import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stream_tutorial_dec_2020/constants.dart';
import 'package:stream_tutorial_dec_2020/theme.dart';

import 'blocs/weathercubit/weather_cubit.dart';
import 'di.dart';
import 'ui/weather_dashboard.dart';

void main() {
  runApp(MyApp());
  initDi();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Pallete.GOLD_COLOR,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      systemStatusBarContrastEnforced: false,
      systemNavigationBarColor: Pallete.GOLD_COLOR,
      systemNavigationBarIconBrightness: Brightness.dark));
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
        title: 'Prewer',
        theme: ThemeData.light().copyWith(
            primaryColor: Colors.black,
            scaffoldBackgroundColor: Pallete.mainColor,
            textTheme: appTheme),
        home: ScreenUtilInit(
          builder: () => FirstScreen(),
        ),
      ),
    );
  }
}
