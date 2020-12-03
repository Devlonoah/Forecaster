import 'package:flutter/material.dart';
import 'package:stream_tutorial_dec_2020/services/weather_api_provider.dart';

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
    // void requestLocation() async {
    //   Position position = await Geolocator.getCurrentPosition(
    //       desiredAccuracy: LocationAccuracy.medium);

    //   print(position.latitude);
    // }

    // void requestPermission() async {
    //   LocationPermission permission = await Geolocator.requestPermission();
    // }

    // void checkPermission() async {
    //   LocationPermission permission =
    //       await Geolocator.checkPermission().then((value) {
    //     if (value == LocationPermission.denied) {
    //       print('denied access');
    //       requestPermission();
    //     } else {
    //       print('access granted');
    //     }
    //   });
    // }

    // checkPermission();

    WeatherApiProvider networkHelper = WeatherApiProvider();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                height: 655,
                width: double.infinity,
                color: Colors.white54,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'PARTLY CLOUDY',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'STOCKHOLM,SWE',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                    Text(
                      '24.',
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RaisedButton(
                      color: Colors.yellow,
                      child: Text('Get Weather Details'),
                      onPressed: () {
//Fetch weather data from api
                        networkHelper.fetchWeatherData();
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
