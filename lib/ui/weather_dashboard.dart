import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:stream_tutorial_dec_2020/blocs/weather_blocs.dart';
import 'package:stream_tutorial_dec_2020/model/weather.dart';
import 'package:stream_tutorial_dec_2020/services/weather_api_provider.dart';

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
  Widget build(BuildContext context) {
    var provBloc = Provider.of<WeatherItemModel>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: Text(
          'Weathie',
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
              icon: Icon(Icons.search),
              onPressed: () {
                //TODO: implement search bar for city shoeing suggestions and other shit
              },
            ),
          )
        ],
      ),
      body: SafeArea(
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            if (orientation == Orientation.portrait) {
              return weatherDetails(data: provBloc, context: context);
            } else {
              return _buildLandscape();
            }
          },
        ),
      ),
    );
  }

  Column weatherDetails({WeatherItemModel data, BuildContext context}) {
    return Column(
      children: <Widget>[
        Spacer(),
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
                data == null ? 'city name' : data.cityName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                data == null ? 'country' : data.country,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
              Text(
                data == null ? '0.' : data.temp,
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 130,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: 20,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: WeatherForecast(),
                      );
                    }),
              ),
              RaisedButton(
                color: Colors.yellow,
                child: Text('Get Weather Details'),
                onPressed: () {
//Fetch weather data from api

                  Provider.of<WeatherBloc>(context, listen: false)
                      .fetchWeatherData();
                  ;
                },
              )
            ],
          ),
        )
      ],
    );
  }
}

//TODO: REFACTOR THE CODE

Widget _buildLandscape() {
  return Row(
    children: <Widget>[
      Container(
        color: Colors.white,
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '20c',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 80),
            ),
          ],
        ),
      ),
      Expanded(
        child: Container(
          color: Colors.white38,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Text(
                'city name',
                // data == null ? 'city name' : data.cityName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                'country name',
                // data == null ? 'country' : data.country,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
              Container(
                height: 130,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: 20,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: WeatherForecast(),
                      );
                    }),
              ),
              RaisedButton(
                color: Colors.yellow,
                child: Text('Get Weather Details'),
                onPressed: () {
//Fetch weather data from api

                  // Provider.of<WeatherBloc>(context, listen: false)
                  //     .fetchWeatherData();
                  ;
                },
              )
            ],
          ),
        ),
      ),
    ],
  );
}

class WeatherForecast extends StatelessWidget {
  const WeatherForecast({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      // height: 100,
      width: 65,
      duration: Duration(milliseconds: 500),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            'WED',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            FontAwesomeIcons.cloudSun,
          ),
          Text(
            '16',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
