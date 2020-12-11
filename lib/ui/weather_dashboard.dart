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
    Provider.of<WeatherBloc>(context, listen: false).fetchWeatherData();

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
      backgroundColor: Pallete.swatchD,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              expandedHeight: 100,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(color: Colors.black),
                title: Text(
                  Provider.of<WeatherBloc>(context, listen: true)
                      .appBar
                      .toUpperCase(),
                  style: TextStyle(
                      color: Colors.white70,
                      fontFamily: 'callofduty',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.3),
                ),
              ),
              brightness: Brightness.dark,
              backgroundColor: Pallete.swatchA,
              actions: <Widget>[
                Container(
                  margin: EdgeInsets.all(8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Pallete.swatchF.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    color: Colors.white,
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
            SliverToBoxAdapter(
              child: StreamBuilder(builder: (context, snapshot) {
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
              }),
            ),
          ],
        ),
      ),
    );
  }
}
