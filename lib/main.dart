import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream_tutorial_dec_2020/blocs/weather_blocs.dart';
import 'package:stream_tutorial_dec_2020/model/weather.dart';
import 'package:stream_tutorial_dec_2020/services/weather_api_provider.dart';

import 'ui/weather_dashboard.dart';

// import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(MyApp());
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
        Provider<WeatherBloc>(create: (context) => WeatherBloc()),
        StreamProvider<WeatherItemModel>(
          create: (context) {
            return WeatherBloc().weatherData;
          },
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        theme: ThemeData.light().copyWith(
            primaryColor: Colors.black,
            accentColor: Colors.red,
            buttonColor: Colors.red),
        home: FirstScreen(),
      ),
    );
  }
}
