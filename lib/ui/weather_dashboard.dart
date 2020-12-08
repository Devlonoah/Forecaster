import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream_tutorial_dec_2020/blocs/weather_blocs.dart';
import 'package:stream_tutorial_dec_2020/constants.dart';
import 'package:stream_tutorial_dec_2020/services/weather_api_provider.dart';

import 'components/landscape_view.dart';
import 'components/portrait_view.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  WeatherApiProvider networkHelper = WeatherApiProvider();

  @override
  void initState() {
    // Provider.of<WeatherBloc>(context, listen: false).fetchWeatherData();

    super.initState();
  }

  @override
  void dispose() {
    Provider.of<WeatherBloc>(context).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<WeatherBloc>(context);
    return Scaffold(
      backgroundColor: Pallete.swatchB,
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Pallete.swatchB,
        title: Text(
          Provider.of<WeatherBloc>(context, listen: true).appBar,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.all(8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1), shape: BoxShape.circle),
            child: IconButton(
              color: Colors.black,
              icon: Icon(
                Icons.location_searching,
              ),
              onPressed: () {
                Provider.of<WeatherBloc>(context, listen: false)
                    .fetchWeatherData();
              },
            ),
          )
        ],
      ),
      body: SafeArea(
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            if (orientation == Orientation.portrait) {
              return buildPortrait(
                bloc: bloc,
                context: context,
              );
            } else {
              return buildLandscape();
            }
          },
        ),
      ),
    );
  }
}
