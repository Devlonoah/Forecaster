import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream_tutorial_dec_2020/blocs/connectivity_blocs.dart';
import 'package:stream_tutorial_dec_2020/blocs/weather_blocs.dart';

import 'blocs/networkstatusbloc.dart';
import 'ui/weather_dashboard.dart';

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
        Provider<WeatherBloc>(
          create: (context) => WeatherBloc(),
        ),
        Provider<ConnectionStateBloc>(
          create: (context) => ConnectionStateBloc(),
        ),
        Provider<NetworkStatusService>(
          create: (context) => NetworkStatusService(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        theme: ThemeData.light().copyWith(
          primaryColor: Colors.black,
          accentColor: Colors.red,
          buttonColor: Colors.red,
        ),
        home: FirstScreen(),
      ),
    );
  }
}
