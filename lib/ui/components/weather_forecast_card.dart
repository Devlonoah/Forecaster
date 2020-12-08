import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeatherForecastCard extends StatelessWidget {
  const WeatherForecastCard({
    this.title,
    this.icon,
    this.value,
  });

  final String title;
  final String icon;
  final double value;
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
            title,
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
            value.toStringAsFixed(1),
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
