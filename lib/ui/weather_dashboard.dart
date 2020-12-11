import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream_tutorial_dec_2020/blocs/connectivity_blocs.dart';
import 'package:stream_tutorial_dec_2020/blocs/networkstatusbloc.dart';
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
  // WeatherApiProvider networkHelper = WeatherApiProvider();

  @override
  void initState() {
    super.initState();
    // Provider.of<WeatherBloc>(context, listen: false).fetchConnectionState();
    Provider.of<WeatherBloc>(context, listen: false).fetchWeatherData();
    // Provider.of<WeatherBloc>(context, listen: false)
    //     .connectivityResultHolderStream
    //     .forEach((element) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text('${element.toString()}'),
    //     ),
    //   );
    // });

    // Provider.of<ConnectionStateBloc>(context, listen: false)
    //     ();
    Provider.of<NetworkStatusService>(context, listen: false)
        .networkStatusController
        .stream
        .forEach((element) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(element.toString()),
      ));
    });
  }

  @override
  void dispose() {
    Provider.of<WeatherBloc>(context).dispose();

    Provider.of<ConnectionStateBloc>(context).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<WeatherBloc>(context);
    return Scaffold(
      appBar: AppBar(
        // floating: false,
        // pinned: true,
        // expandedHeight: 100,
        title: Text(
          Provider.of<WeatherBloc>(context, listen: true).appBar.toUpperCase(),
          style: TextStyle(
              color: Colors.white70,
              fontFamily: 'callofduty',
              fontWeight: FontWeight.bold,
              letterSpacing: 2.3),
        ),
        brightness: Brightness.dark,
        backgroundColor: Pallete.swatchA,
        actions: <Widget>[
          GestureDetector(
            onTap: () => Provider.of<WeatherBloc>(context, listen: false)
                .fetchWeatherData(),
            child: Container(
              margin: EdgeInsets.all(8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                // color: Pallete.swatchF.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.location_city_outlined,
                size: 25,
              ),
            ),
          )
        ],
      ),
      backgroundColor: Pallete.swatchD,
      body: SafeArea(
        child: StreamBuilder(
          stream: Provider.of<WeatherBloc>(context).weatherData,
          builder: (context, snapshot) {
            return OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
                if (orientation == Orientation.portrait) {
                  return buildPortrait(
                      bloc: bloc, snapshot: snapshot, context: context);
                } else {
                  return buildLandscape(snapshot: snapshot);
                }
              },
            );
          },
        ),
      ),
    );
  }
}
