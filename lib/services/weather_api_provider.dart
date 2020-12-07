import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:stream_tutorial_dec_2020/model/weatherItemModel.dart';

class WeatherApiProvider {
  Future<WeatherItemModel> fetchWeatherData({double lat, double long}) async {
    String api =
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=ef7492ff156e3449f868bf20f5bf097a";

    try {
      http.Response response = await http.get(api);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        WeatherItemModel exploreData = WeatherItemModel.fromMap(data);
        print(exploreData.coord);

        //we are retuening instance of WeatherItemModel that has data
        return exploreData;
      }
    } catch (e) {
      print('error code message : ${e.toString()}');
    }
  }
}
