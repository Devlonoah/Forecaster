import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import 'package:stream_tutorial_dec_2020/model/weather.dart';

class WeatherApiProvider {
  Future<WeatherItemModel> fetchWeatherData({double lat, double long}) async {
    String api =
        "http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=ef7492ff156e3449f868bf20f5bf097a";

    try {
      http.Response response = await http.get(api);

      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        print('wassup response loaded');
        print(decodedData);

        return WeatherItemModel.fromJson(decodedData);
      }
    } catch (e) {
      print('error code message : ${e.toString()}');
    }
  }
}
